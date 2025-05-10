import 'package:jaspr/browser.dart';

enum CardVariant {
  standard,
  highlighted,
  compact,
  blueGlow,
  greenGlow,
  orangeGlow,
}

enum CategoryAccent {
  none,
  purple,
  blue,
  green,
  orange,
}

class ResourceLink extends StatelessComponent {
  const ResourceLink({
    super.key,
    required this.emoji,
    required this.title,
    required this.link,
    this.description,
    this.variant = CardVariant.standard,
  });

  final String emoji;
  final String title;
  final String link;
  final String? description;
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

    yield li(
      attributes: {'role': 'listitem'},
      [
        div(
          classes: variantClasses.join(' '),
          [
            span(classes: 'resource-emoji', [text(emoji)]),
            div(
              classes: 'resource-content',
              [
                a(
                  href: link,
                  target: Target.blank,
                  attributes: {
                    'aria-label': '$title - ${description ?? ''}',
                    'rel': 'noopener noreferrer',
                  },
                  classes: 'resource-title',
                  [text(title)],
                ),
                if (description != null && variant != CardVariant.compact)
                  p(
                    classes: 'resource-description',
                    [text(description!)],
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class ResourceCategory extends StatelessComponent {
  const ResourceCategory({
    super.key,
    required this.title,
    required this.resources,
    this.accent = CategoryAccent.none,
    this.useGrid = false,
    this.useHorizontalScroll = false,
  });

  final String title;
  final List<ResourceLink> resources;
  final CategoryAccent accent;
  final bool useGrid;
  final bool useHorizontalScroll;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final categoryClasses = <String>['resource-category'];

    switch (accent) {
      case CategoryAccent.none:
        // No additional class needed
        break;
      case CategoryAccent.purple:
        categoryClasses.add('purple-accent');
        break;
      case CategoryAccent.blue:
        categoryClasses.add('blue-accent');
        break;
      case CategoryAccent.green:
        categoryClasses.add('green-accent');
        break;
      case CategoryAccent.orange:
        categoryClasses.add('orange-accent');
        break;
    }

    yield div(
      classes: categoryClasses.join(' '),
      attributes: {
        'role': 'region',
        'aria-label': title,
      },
      [
        h3(classes: 'category-title', [text(title)]),
        if (useHorizontalScroll)
          div(
            classes: 'scrollable-container',
            [
              div(
                classes: 'scrollable-items',
                resources,
              ),
            ],
          )
        else
          ul(
            classes: useGrid ? 'resource-list grid-layout' : 'resource-list',
            attributes: {'role': 'list'},
            resources,
          ),
      ],
    );
  }
}
