/// One episode of the FCAIC livestream on the Flutter Community YouTube channel.
class Livestream {
  const Livestream({
    required this.videoId,
    required this.number,
    required this.topic,
    required this.length,
    required this.date,
  });

  final String videoId;
  final int number;
  final String topic;

  /// Duration as YouTube shows it, e.g. `1:02:13`.
  final String length;

  /// Stream start date in Europe/Berlin, ISO 8601 (`yyyy-MM-dd`).
  final String date;

  static const playlistId = 'PL4dBIh1xps-HIYvaEIbLWHZqt_WGBfpx3';

  String get year => date.substring(0, 4);

  String get watchUrl => 'https://www.youtube.com/watch?v=$videoId&list=$playlistId';

  String thumbnailUrl({bool large = false}) =>
      'https://i.ytimg.com/vi/$videoId/${large ? 'maxresdefault' : 'hqdefault'}.jpg';

  int get lengthInSeconds {
    const secondsPerUnit = 60;
    return length
        .split(':')
        .fold(0, (total, part) => total * secondsPerUnit + (int.tryParse(part) ?? 0));
  }

  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', //
  ];

  String get monthYear => '${_months[int.parse(date.substring(5, 7)) - 1]} $year';

  String get prettyDate => '${int.parse(date.substring(8, 10))} $monthYear';

  bool matches(String query) => '#$number $topic'.toLowerCase().contains(query);
}
