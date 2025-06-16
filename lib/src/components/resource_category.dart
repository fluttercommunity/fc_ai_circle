import 'package:jaspr/browser.dart';
import 'package:fc_ai_circle/src/components/resource_link.dart';

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

class ResourceCategory extends StatelessComponent {
  const ResourceCategory({
    super.key,
    required this.title,
    required this.resources,
    this.accent = CategoryAccent.none,
    this.useGrid = false,
    this.useHorizontalScroll = false,
    this.useMasonryGrid = false,
  });

  final String title;
  final List<ResourceLink> resources;
  final CategoryAccent accent;
  final bool useGrid;
  final bool useHorizontalScroll;
  final bool useMasonryGrid;

  String get accentClassName {
    switch (accent) {
      case CategoryAccent.none:
        return '';
      case CategoryAccent.purple:
        return 'purple-accent';
      case CategoryAccent.blue:
        return 'blue-accent';
      case CategoryAccent.green:
        return 'green-accent';
      case CategoryAccent.orange:
        return 'orange-accent';
    }
  }

  Component renderScrollableContainer(String containerId) {
    return div(
      classes: 'scrollable-container dynamic-scroll-buttons',
      attributes: {
        'id': containerId,
      },
      [
        div(
          classes: 'scroll-nav-button scroll-nav-left',
          attributes: {
            'aria-label': 'Scroll left',
            'style': 'display: none; background-color: var(--primary-color); color: white;',
            'title': 'Scroll to see previous items',
          },
          [text('←')],
        ),
        div(
          classes: 'scroll-nav-button scroll-nav-right',
          attributes: {
            'aria-label': 'Scroll right',
            'style': 'display: none; background-color: var(--primary-color); color: white;',
            'title': 'Scroll to see more items',
          },
          [text('→')],
        ),
        div(
          classes: 'scrollable-items',
          resources,
        ),
      ],
    );
  }

  Component renderResourceList() {
    return div(
      classes: 'resource-list',
      resources,
    );
  }

  Component renderResourceGrid() {
    return div(
      classes: 'resource-grid',
      resources,
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final categoryClasses = <String>['resource-category'];
    final String containerId = 'scrollable-${DateTime.now().millisecondsSinceEpoch}';

    if (accentClassName.isNotEmpty) {
      categoryClasses.add(accentClassName);
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
          renderScrollableContainer(containerId)
        else if (useGrid)
          renderResourceGrid()
        else
          renderResourceList(),
      ],
    );
  }
}
