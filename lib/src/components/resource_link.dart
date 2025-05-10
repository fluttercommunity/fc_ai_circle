import 'package:jaspr/browser.dart';

class ResourceLink extends StatelessComponent {
  const ResourceLink({
    super.key,
    required this.emoji,
    required this.title,
    required this.link,
    this.description,
  });

  final String emoji;
  final String title;
  final String link;
  final String? description;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield li(
      attributes: {'role': 'listitem'},
      [
        div(
          classes: 'resource-link',
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
                if (description != null)
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
  });

  final String title;
  final List<ResourceLink> resources;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'resource-category',
      attributes: {'role': 'region', 'aria-label': title},
      [
        h3(classes: 'category-title', [text(title)]),
        ul(
          classes: 'resource-list',
          attributes: {'role': 'list'},
          resources,
        ),
      ],
    );
  }
}
