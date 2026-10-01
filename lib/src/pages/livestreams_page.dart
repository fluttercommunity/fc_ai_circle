import 'package:fc_ai_circle/src/app/external_links.dart';
import 'package:fc_ai_circle/src/components/page_hero.dart';
import 'package:fc_ai_circle/src/data/livestream.dart';
import 'package:fc_ai_circle/src/data/livestreams.g.dart';
import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';

/// Every FCAIC episode, newest first, grouped by year and searchable by number or topic.
///
/// The episode list is generated: run `dart run tool/fetch_livestreams.dart` after each stream.
class LivestreamsPage extends StatefulComponent {
  const LivestreamsPage({super.key});

  static const path = '/livestreams';

  static Iterable<Route> route() sync* {
    yield Route(
      path: path,
      title: 'Livestreams - Flutter Community AI Circle',
      builder: (BuildContext context, RouteState state) => const LivestreamsPage(),
    );
  }

  @override
  State<LivestreamsPage> createState() => _LivestreamsPageState();
}

class _LivestreamsPageState extends State<LivestreamsPage> {
  String _search = '';

  String get _query => _search.trim().toLowerCase();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final latest = livestreams.first;
    final archive = livestreams.skip(1).where((episode) => episode.matches(_query)).toList();
    final years = {for (final episode in archive) episode.year}.toList()
      ..sort((first, second) => second.compareTo(first));

    yield PageLayout(
      children: [
        PageHero(
          title: 'Livestreams',
          description: 'The Flutter Community AI Circle goes live on the Flutter Community '
              'YouTube channel: we build agentic apps, try new AI tools on real Flutter code, '
              'and bring on guests from the community.',
          callout: _HeroCallout(),
        ),
        section(classes: 'livestreams container', [
          _LivestreamCard(episode: latest, featured: true),
          div(classes: 'livestreams-tools', [
            input(
              [],
              type: InputType.search,
              classes: 'livestreams-search',
              value: _search,
              attributes: {
                'placeholder': 'Search episodes: Gemini, MCP, Genkit…',
                'aria-label': 'Search episodes',
              },
              onInput: (value) => setState(() => _search = '$value'),
            ),
            span(
              classes: 'livestreams-count',
              attributes: {'aria-live': 'polite'},
              [if (_query.isNotEmpty) text('${archive.length} of ${livestreams.length - 1}')],
            ),
          ]),
          for (final year in years)
            div(classes: 'livestreams-year', [
              h2([text(year)]),
              div(classes: 'livestreams-grid', [
                for (final episode in archive.where((episode) => episode.year == year))
                  _LivestreamCard(episode: episode),
              ]),
            ]),
          if (archive.isEmpty)
            p(classes: 'livestreams-empty', [text('No episode matches that search.')]),
        ]),
      ],
    );
  }
}

class _HeroCallout extends StatelessComponent {
  const _HeroCallout();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    const secondsPerHour = 3600;
    final totalHours =
        (livestreams.fold(0, (total, episode) => total + episode.lengthInSeconds) / secondsPerHour)
            .round();

    yield div(classes: 'livestreams-callout', [
      ul(classes: 'livestreams-stats', [
        li([text('${livestreams.length} episodes')]),
        li([text('about $totalHours hours live')]),
        li([text('since ${livestreams.last.monthYear}')]),
      ]),
      div(classes: 'buttons-container', [
        a(
          classes: 'cta_button',
          href: ExternalLink.youTubePlaylist.url,
          target: Target.blank,
          attributes: {'rel': 'noopener noreferrer'},
          [text('Watch the playlist')],
        ),
        a(
          classes: 'secondary-button',
          href: ExternalLink.sessionizeCallForSpeakers.url,
          target: Target.blank,
          attributes: {'rel': 'noopener noreferrer'},
          [text('Pitch a topic')],
        ),
      ]),
    ]);
  }
}

class _LivestreamCard extends StatelessComponent {
  const _LivestreamCard({required this.episode, this.featured = false});

  final Livestream episode;
  final bool featured;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield a(
      classes: featured ? 'livestream-card featured' : 'livestream-card',
      href: episode.watchUrl,
      target: Target.blank,
      attributes: {'rel': 'noopener noreferrer'},
      [
        span(classes: 'livestream-thumb', [
          img(
            src: episode.thumbnailUrl(large: featured),
            alt: '',
            loading: featured ? MediaLoading.eager : MediaLoading.lazy,
            referrerPolicy: ReferrerPolicy.noReferrer,
          ),
          if (episode.length.isNotEmpty) span(classes: 'livestream-length', [text(episode.length)]),
        ]),
        span(classes: 'livestream-meta', [
          span(classes: 'livestream-number', [
            text('${featured ? 'Latest episode · ' : ''}#${episode.number}'),
          ]),
          span(classes: 'livestream-topic', [text(episode.topic)]),
          DomComponent(
            tag: 'time',
            classes: 'livestream-date',
            attributes: {'datetime': episode.date},
            children: [text(episode.prettyDate)],
          ),
        ]),
      ],
    );
  }
}
