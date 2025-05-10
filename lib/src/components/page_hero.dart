import 'package:jaspr/browser.dart';

class PageHero extends StatelessComponent {
  const PageHero({
    super.key,
    required this.title,
    this.description,
    this.callout,
  });

  final String title;
  final String? description;
  final Component? callout;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      classes: 'hero',
      attributes: {'role': 'banner'},
      [
        div(classes: 'container', [
          div(
            classes: 'hero-content',
            [
              h1(
                classes: 'page-title',
                [
                  span(
                    classes: 'title-text',
                    [text(title)],
                  ),
                ],
              ),
              if (description != null) p(classes: 'hero-description', [text(description!)]),
              if (callout != null) callout!,
            ],
          ),
        ]),
      ],
    );
  }
}
