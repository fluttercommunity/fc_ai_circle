/// Regenerates lib/src/data/livestreams.g.dart from the FCAIC YouTube playlist.
///
/// Run from the repo root after each stream: `dart run tool/fetch_livestreams.dart`
library;

import 'dart:convert';
import 'dart:io';

import 'package:fc_ai_circle/src/data/livestream.dart';

const outputPath = 'lib/src/data/livestreams.g.dart';
const fetchWorkers = 4;
const fetchAttempts = 4;
const headers = {
  'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 14_0) AppleWebKit/537.36 '
      'Chrome/126 Safari/537.36',
  'Accept-Language': 'en',
  'Cookie': 'CONSENT=YES+1; SOCS=CAI',
};

final client = HttpClient();

Future<void> main() async {
  try {
    final playlistPage = await fetch(
      'https://www.youtube.com/playlist?list=${Livestream.playlistId}&hl=en',
    );
    final videos = <({String id, String title, String length})>[];
    collectVideos(initialData(playlistPage), videos);
    if (videos.isEmpty) {
      throw StateError('No videos found in the playlist page.');
    }

    final dates = <String>[];
    for (var start = 0; start < videos.length; start += fetchWorkers) {
      final batch = videos.skip(start).take(fetchWorkers);
      dates.addAll(await Future.wait(batch.map((video) => streamDate(video.id))));
    }

    final episodes = [
      for (final (index, video) in videos.indexed) episode(video, dates[index]),
    ]..sort((first, second) => second.number.compareTo(first.number));

    await File(outputPath).writeAsString(render(episodes));
    await Process.run('dart', ['format', outputPath]);
    stdout.writeln('${episodes.length} livestreams written to $outputPath');
  } finally {
    client.close();
  }
}

Future<String> fetch(String url) async {
  final request = await client.getUrl(Uri.parse(url));
  headers.forEach(request.headers.set);
  final response = await request.close();
  if (response.statusCode != HttpStatus.ok) {
    throw HttpException('HTTP ${response.statusCode}', uri: Uri.parse(url));
  }
  return response.transform(utf8.decoder).join();
}

/// Extracts the `ytInitialData` JSON object embedded in a YouTube page.
Object? initialData(String page) {
  final start = page.indexOf('{', page.indexOf('ytInitialData'));
  var depth = 0;
  var inString = false;
  var escaped = false;
  for (var index = start; index < page.length; index++) {
    final character = page[index];
    if (inString) {
      if (escaped) {
        escaped = false;
      } else if (character == r'\') {
        escaped = true;
      } else if (character == '"') {
        inString = false;
      }
    } else if (character == '"') {
      inString = true;
    } else if (character == '{') {
      depth++;
    } else if (character == '}' && --depth == 0) {
      return jsonDecode(page.substring(start, index + 1));
    }
  }
  throw const FormatException('ytInitialData is not a complete JSON object.');
}

void collectVideos(Object? node, List<({String id, String title, String length})> videos) {
  if (node is Map) {
    final lockup = node['lockupViewModel'];
    if (lockup is Map) {
      final title = lockup['metadata']?['lockupMetadataViewModel']?['title']?['content'];
      final badges = collectTexts(lockup['contentImage'], [])
          .where((text) => RegExp(r'^[\d:]+$').hasMatch(text));
      videos.add((
        id: lockup['contentId'] as String,
        title: title is String ? title : '',
        length: badges.isEmpty ? '' : badges.first,
      ));
      return;
    }
    for (final value in node.values) {
      collectVideos(value, videos);
    }
  } else if (node is List) {
    for (final value in node) {
      collectVideos(value, videos);
    }
  }
}

List<String> collectTexts(Object? node, List<String> found) {
  if (node is Map) {
    for (final key in ['content', 'text']) {
      if (node[key] case final String text) found.add(text);
    }
    for (final value in node.values) {
      collectTexts(value, found);
    }
  } else if (node is List) {
    for (final value in node) {
      collectTexts(value, found);
    }
  }
  return found;
}

/// YouTube now and then serves a watch page without the player data, so a few attempts are normal.
Future<String> streamDate(String videoId) async {
  final streamStart = RegExp(r'"startTimestamp":"([^"]+)"');
  final published = RegExp(r'"publishDate":"([^"]+)"');
  for (var attempt = 0; attempt < fetchAttempts; attempt++) {
    final page = await fetch('https://www.youtube.com/watch?v=$videoId&hl=en');
    final match = streamStart.firstMatch(page) ?? published.firstMatch(page);
    if (match != null) {
      return berlinDate(DateTime.parse(match.group(1)!).toUtc());
    }
  }
  throw StateError('No stream date found for $videoId after $fetchAttempts attempts.');
}

/// Europe/Berlin is UTC+2 from the last Sunday of March to the last Sunday of October
/// (switching at 01:00 UTC), and UTC+1 otherwise.
String berlinDate(DateTime utc) {
  DateTime lastSundayOneAm(int month) {
    final lastDay = DateTime.utc(utc.year, month + 1, 0, 1);
    return lastDay.subtract(Duration(days: lastDay.weekday % DateTime.daysPerWeek));
  }

  final summerTime = !utc.isBefore(lastSundayOneAm(DateTime.march)) &&
      utc.isBefore(lastSundayOneAm(DateTime.october));
  final local = utc.add(Duration(hours: summerTime ? 2 : 1));
  return local.toIso8601String().substring(0, 10);
}

Livestream episode(({String id, String title, String length}) video, String date) {
  final match = RegExp(r'^\s*(?:FCAIC\s*)?#(\d+)\s*[-–:]?\s*(.*)$').firstMatch(video.title);
  if (match == null) {
    throw FormatException('Title has no episode number: ${video.title}');
  }
  final topic = match.group(2)!.replaceAll(RegExp(r'\s+'), ' ').replaceAll(' – ', ': ').trim();
  return Livestream(
    videoId: video.id,
    number: int.parse(match.group(1)!),
    topic: topic,
    length: video.length,
    date: date,
  );
}

String render(List<Livestream> episodes) {
  final buffer = StringBuffer()
    ..writeln('// Generated by tool/fetch_livestreams.dart. Do not edit by hand.')
    ..writeln()
    ..writeln("import 'package:fc_ai_circle/src/data/livestream.dart';")
    ..writeln()
    ..writeln('const livestreams = <Livestream>[');
  for (final episode in episodes) {
    buffer
      ..writeln('  Livestream(')
      ..writeln('    videoId: ${literal(episode.videoId)},')
      ..writeln('    number: ${episode.number},')
      ..writeln('    topic: ${literal(episode.topic)},')
      ..writeln('    length: ${literal(episode.length)},')
      ..writeln('    date: ${literal(episode.date)},')
      ..writeln('  ),');
  }
  buffer.writeln('];');
  return buffer.toString();
}

String literal(String value) {
  final escaped = value
      .replaceAll(r'\', r'\\')
      .replaceAll("'", r"\'")
      .replaceAll(r'$', r'\$')
      .replaceAll('\n', r'\n');
  return "'$escaped'";
}
