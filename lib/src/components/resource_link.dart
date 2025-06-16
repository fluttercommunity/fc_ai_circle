import 'package:jaspr/browser.dart';

enum CardVariant {
  standard,
  highlighted,
  compact,
  blueGlow,
  greenGlow,
  orangeGlow,
}

class ResourceLink extends StatelessComponent {
  const ResourceLink({
    super.key,
    required this.title,
    required this.description,
    required this.url,
    this.emoji,
    this.variant = CardVariant.standard,
  });

  final String title;
  final String description;
  final String url;
  final String? emoji;
  final CardVariant variant;

  String get variantClassName {
    switch (variant) {
      case CardVariant.standard:
        return '';
      case CardVariant.highlighted:
        return 'highlighted';
      case CardVariant.compact:
        return 'compact';
      case CardVariant.blueGlow:
        return 'blue-glow';
      case CardVariant.greenGlow:
        return 'green-glow';
      case CardVariant.orangeGlow:
        return 'orange-glow';
    }
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final variantClasses = <String>['resource-link'];

    if (variantClassName.isNotEmpty) {
      variantClasses.add(variantClassName);
    }

    yield a(
      href: url,
      target: Target.blank,
      attributes: {'rel': 'noopener noreferrer'},
      classes: variantClasses.join(' '),
      [
        if (emoji != null)
          span(
            classes: 'resource-emoji',
            attributes: {'aria-hidden': 'true'},
            [text(emoji!)],
          ),
        div(
          classes: 'resource-content',
          [
            div(
              classes: 'resource-title',
              [
                if (emoji != null) text('$emoji '),
                text(title),
              ],
            ),
            div(
              classes: 'resource-description',
              [
                text(description),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
