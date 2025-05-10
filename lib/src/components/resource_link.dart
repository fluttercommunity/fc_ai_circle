import 'dart:async';
import 'dart:html' as html;
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
          attributes: {
            // Add a data attribute for card height calculation in masonry grid
            'data-card-height': '${description != null ? (description!.length ~/ 2) + 120 : 80}',
          },
          [
            span(classes: 'resource-emoji', attributes: {'aria-hidden': 'true'}, [text(emoji)]),
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
                  [
                    text(title),
                    // The arrow is now added via CSS :after pseudo-element
                  ],
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
              // Add the check overflow logic as an onMount script attribute
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
                  'style':
                      'display: none; background-color: var(--primary-color); color: white;', // Hidden by default, improved contrast
                  'title': 'Scroll to see previous items',
                },
                [text('←')],
              ),
              div(
                classes: 'scroll-nav-button scroll-nav-right',
                attributes: {
                  'aria-label': 'Scroll right',
                  'style':
                      'display: none; background-color: var(--primary-color); color: white;', // Hidden by default, improved contrast
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
        else
          ul(
            classes: [
              'resource-list',
              if (useGrid) 'grid-layout',
              if (useMasonryGrid) 'masonry-grid',
            ].where((c) => c.isNotEmpty).join(' '),
            attributes: {
              'role': 'list',
              if (useMasonryGrid)
                'data-onrender': '''
                document.querySelectorAll('.masonry-grid .resource-link').forEach(card => {
                  const height = card.getAttribute('data-card-height');
                  if (height) {
                    card.style.setProperty('--card-height', height);
                  }
                });
              ''',
            },
            resources,
          ),
      ],
    );

    // If we're using horizontal scroll or masonry grid, also add a script to the page
    // to look for the data-onrender attribute and execute it
    if (useHorizontalScroll || useMasonryGrid) {
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
