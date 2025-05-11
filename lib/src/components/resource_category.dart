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

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final categoryClasses = <String>['resource-category'];
    final String containerId = 'scrollable-${DateTime.now().millisecondsSinceEpoch}';

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
            classes: 'scrollable-container dynamic-scroll-buttons',
            attributes: {
              'id': containerId,
              'data-onrender': '''
                const container = document.getElementById('$containerId');
                if (container) {
                  const items = container.querySelector('.scrollable-items');
                  const leftBtn = container.querySelector('.scroll-nav-left');
                  const rightBtn = container.querySelector('.scroll-nav-right');
                  
                  function checkOverflow() {
                    if (items && leftBtn && rightBtn) {
                      const hasOverflow = items.scrollWidth > items.clientWidth;
                      leftBtn.style.display = hasOverflow ? 'flex' : 'none';
                      rightBtn.style.display = hasOverflow ? 'flex' : 'none';
                    }
                  }
                  
                  // Check on load
                  checkOverflow();
                  
                  // Check on resize
                  window.addEventListener('resize', checkOverflow);
                  
                  // Add event listeners for button clicks
                  if (leftBtn) {
                    leftBtn.addEventListener('click', () => {
                      items.scrollBy({ left: -300, behavior: 'smooth' });
                    });
                  }
                  
                  if (rightBtn) {
                    rightBtn.addEventListener('click', () => {
                      items.scrollBy({ left: 300, behavior: 'smooth' });
                    });
                  }
                }
              '''
            },
            [
              // Navigation buttons (visibility controlled by JS)
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
          )
        else if (useGrid)
          div(
            classes: 'resource-grid',
            resources,
          )
        else
          div(
            classes: 'resource-list',
            resources,
          ),
      ],
    );

    // If we're using horizontal scroll, also add a script to the page
    // to look for the data-onrender attribute and execute it
    if (useHorizontalScroll) {
      yield script(
        src: '',
        attributes: {'type': 'text/javascript'},
        [
          text('''
            document.addEventListener('DOMContentLoaded', function() {
              // Find all elements with data-onrender attribute
              document.querySelectorAll('[data-onrender]').forEach(function(el) {
                // Execute the script in data-onrender
                try {
                  const scriptContent = el.getAttribute('data-onrender');
                  if (scriptContent) {
                    new Function(scriptContent)();
                  }
                } catch (e) {
                  console.error('Error executing onrender script:', e);
                }
              });
            });
          '''),
        ],
      );
    }
  }
}
