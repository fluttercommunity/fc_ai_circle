import 'package:jaspr/browser.dart';

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

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final variantClasses = <String>['resource-link'];

    switch (variant) {
      case CardVariant.standard:
        // No additional class needed
        break;
      case CardVariant.highlighted:
        variantClasses.add('highlighted');
        break;
      case CardVariant.compact:
        variantClasses.add('compact');
        break;
      case CardVariant.blueGlow:
        variantClasses.add('blue-glow');
        break;
      case CardVariant.greenGlow:
        variantClasses.add('green-glow');
        break;
      case CardVariant.orangeGlow:
        variantClasses.add('orange-glow');
        break;
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

enum CardVariant {
  standard,
  highlighted,
  compact,
  blueGlow,
  greenGlow,
  orangeGlow,
}
