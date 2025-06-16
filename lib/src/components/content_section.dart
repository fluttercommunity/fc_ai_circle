import 'package:jaspr/browser.dart';

class ContentSection extends StatelessComponent {
  const ContentSection({
    super.key,
    required this.title,
    this.id,
    this.emoji,
    this.description,
    this.contentPadding = true,
    this.elevated = false,
    required this.children,
  });

  final String title;
  final String? id;
  final String? emoji;
  final String? description;
  final bool contentPadding;
  final bool elevated;
  final List<Component> children;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: id,
      classes: ['content-section', if (elevated) 'elevated-section'].join(' '),
      attributes: {'role': 'region', 'aria-label': title},
      [
        div(
          classes: 'container',
          [
            h2(
              classes: 'section-title',
              [
                if (emoji != null)
                  span(
                    attributes: {'aria-hidden': 'true'},
                    [text('$emoji ')],
                  ),
                text(title),
              ],
            ),
            if (description != null)
              p(
                classes: 'section-description',
                [text(description!)],
              ),
            div(
              classes: contentPadding ? 'section-content' : '',
              children,
            ),
          ],
        ),
      ],
    );
  }
}

class ContentCard extends StatelessComponent {
  const ContentCard({
    super.key,
    required this.children,
    this.elevated = false,
    this.animateCta = false,
  });

  final List<Component> children;
  final bool elevated;
  final bool animateCta;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: [
        'content-card',
        if (elevated) 'elevated',
        if (animateCta) 'animate-cta',
      ].where((c) => c.isNotEmpty).join(' '),
      children,
    );
  }
}

class EmojiCallout extends StatelessComponent {
  const EmojiCallout({
    super.key,
    required this.emoji,
    required this.children,
    this.blurred = true,
  });

  final String emoji;
  final List<Component> children;
  final bool blurred;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // Get a description of the emoji for screen readers
    final String emojiDescription = _getEmojiDescription(emoji);

    yield div(
      classes: ['emoji-callout', if (blurred) 'blurred'].join(' '),
      [
        span(
          classes: 'emoji',
          attributes: {'aria-hidden': 'true'}, // Hide from screen readers as we'll describe it
          [text(emoji)],
        ),
        // Add hidden text for screen readers
        span(
          attributes: {
            'class': 'sr-only',
            'role': 'presentation',
          },
          [text(emojiDescription)],
        ),
        div(classes: 'emoji-content', children),
      ],
    );
  }

  // Helper method to get a description of common emojis
  String _getEmojiDescription(String emoji) {
    switch (emoji) {
      case '🧠':
        return 'Brain emoji representing knowledge or thinking';
      case '🚀':
        return 'Rocket emoji representing launch or fast progress';
      case '🌟':
        return 'Star emoji representing excellence or highlights';
      case '🎯':
        return 'Target emoji representing goals or mission';
      case '📦':
        return 'Package emoji representing products or deliverables';
      case '🧰':
        return 'Toolbox emoji representing toolkit or resources';
      case '✨':
        return 'Sparkles emoji representing new features or excitement';
      case '🔗':
        return 'Link emoji representing connections or contributions';
      case '🧪':
        return 'Test tube emoji representing experiments or tests';
      default:
        return 'Emoji';
    }
  }
}
