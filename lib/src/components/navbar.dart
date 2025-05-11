import 'package:fc_ai_circle/src/app/external_links.dart';
import 'package:fc_ai_circle/src/components/take_survey.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart' show Router;
import 'package:fc_ai_circle/src/pages/builders_page.dart';
import 'package:fc_ai_circle/src/pages/home_page.dart';
import 'package:fc_ai_circle/src/pages/starters_page.dart';
import 'package:web/web.dart' show window;

class Navbar extends StatefulComponent {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  bool _isMenuOpen = false;

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield nav(
      id: 'navbar',
      classes: 'navbar',
      [
        div(
          classes: 'container',
          [
            // Top row with logo and mobile menu toggle
            div(
              classes: 'navbar-top-row',
              [
                a(
                  href: HomePage.path,
                  onClick: () => Router.of(context).push(HomePage.path),
                  classes: 'navbar-brand',
                  [
                    img(
                      src: '/images/logo_1x.png',
                      alt: 'Flutter Community AI Circle',
                    )
                  ],
                ),
                // Mobile menu toggle button
                div(
                  classes: 'mobile-menu-toggle',
                  events: {
                    'click': (event) => _toggleMenu(),
                  },
                  [
                    span([]),
                    span([]),
                    span([]),
                  ],
                ),
              ],
            ),
            // Navigation links with proper wrapper
            div(
              classes: 'nav-menu-container ${_isMenuOpen ? 'open' : ''}',
              [
                div(
                  classes: 'nav-links',
                  [
                    _NavItem(path: '/', label: 'Home'),
                    _NavItem(path: StartersPage.path, label: 'Starters'),
                    _NavItem(path: BuildersPage.path, label: 'Builders'),
                    _NavItem(link: ExternalLink.youTubePlaylist, label: 'YouTube'),
                    _NavItem(link: ExternalLink.socialGitHub, label: 'GitHub'),
                    _NavItem(link: ExternalLink.forumCategory, label: 'Forum'),
                  ],
                ),
                // Survey button inside nav container for mobile
                div(
                  classes: 'navbar-cta',
                  [TakeSurvey()],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _NavItem extends StatelessComponent {
  const _NavItem({
    this.path,
    this.link,
    required this.label,
  });

  final String? path;
  final ExternalLink? link;
  final String label;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final selected = window.location.pathname == path;
    yield a(
      classes: [
        'nav-link',
        if (selected) 'nav-selected',
      ].join(' '),
      href: path ?? link!.url,
      target: link != null ? Target.blank : null,
      onClick: path != null ? () => Router.of(context).push(path!) : null,
      [text(label)],
    );
  }
}
