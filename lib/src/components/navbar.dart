import 'package:fc_ai_circle/src/components/take_survey.dart';
import 'package:jaspr/browser.dart';

class Navbar extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield nav(classes: 'navbar', [
      div(classes: 'container', [
        a(
          href: '/',
          classes: 'navbar-brand',
          [
            img(
              src: '/images/logo_1x.png',
              alt: 'Flutter Community AI Circle',
            )
          ],
        ),
        div(
          classes: 'nav-links',
          [
            a(href: '/', classes: 'nav-link', [text('Home')]),
            a(href: '/starters', classes: 'nav-link', [text('Starters')]),
            a(href: '/builders', classes: 'nav-link', [text('Builders')]),
            a(href: '/youtube', classes: 'nav-link', [text('YouTube')]),
            a(href: '/github', classes: 'nav-link', [text('GitHub')]),
            a(href: '/forum', classes: 'nav-link', [text('Forum')]),
          ],
        ),
        TakeSurvey(),
      ]),
    ]);
  }
}
