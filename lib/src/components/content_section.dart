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
                if (emoji != null) text('$emoji '),
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
    yield div(
      classes: ['emoji-callout', if (blurred) 'blurred'].join(' '),
      [
        span(classes: 'emoji', [text(emoji)]),
        div(classes: 'emoji-content', children),
      ],
    );
  }
}
