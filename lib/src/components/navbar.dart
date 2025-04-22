import 'package:jaspr/browser.dart';

class Navbar extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'nav',
      classes: 'navbar',
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          children: [
            DomComponent(
              tag: 'a',
              attributes: {'href': '#'},
              classes: 'navbar-brand',
              child: RawText('Flutter Community<br>AI Circle'),
            ),
            DomComponent(
              tag: 'div',
              classes: 'nav-links',
              children: [
                _navLink('Home', '#'),
                _navLink('Forum', '#forum'),
                _navLink('YouTube', '#youtube'),
                _navLink('GitHub', '#github'),
                _navLink('Docs', '#docs'),
              ],
            ),
            DomComponent(
              tag: 'a',
              classes: 'cta_button',
              attributes: {'href': '#'},
              child: Text('Take the Survey'),
            ),
          ],
        ),
      ],
    );
  }

  Component _navLink(String text, String href) {
    return DomComponent(
      tag: 'a',
      attributes: {'href': href},
      classes: 'nav-link',
      child: Text(text),
    );
  }
}
