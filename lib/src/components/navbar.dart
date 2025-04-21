import 'package:jaspr/browser.dart';
import 'package:web/web.dart' hide Text;

class Navbar extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'nav',
      styles: Styles(raw: {
        'position': 'fixed',
        'top': '0',
        'left': '0',
        'right': '0',
        'z-index': '100',
        'padding': '20px 0',
        'background-color': 'rgba(0, 0, 0, 0.8)',
        'backdrop-filter': 'blur(10px)',
      }),
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          styles: Styles(raw: {
            'display': 'flex',
            'justify-content': 'space-between',
            'align-items': 'center',
          }),
          children: [
            DomComponent(
              tag: 'a',
              attributes: {'href': '#'},
              styles: Styles(raw: {
                'font-size': '24px',
                'font-weight': 'bold',
                'color': 'var(--accent-color)',
              }),
              child: RawText('Flutter Community<br>AI Circle'),
            ),
            DomComponent(
              tag: 'div',
              classes: 'nav-links',
              styles: Styles(raw: {
                'display': 'flex',
                'gap': '30px',
              }),
              children: [
                _navLink('Home', '#'),
                _navLink('Features', '#features'),
                _navLink('Pricing', '#pricing'),
                _navLink('About', '#about'),
                _navLink('Contact', '#contact'),
              ],
            ),
            DomComponent(
              tag: 'a',
              classes: 'cta_button',
              attributes: {'href': '#'},
              child: Text('Join the Circle'),
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
      styles: Styles(raw: {
        'font-weight': '500',
      }),
      child: Text(text),
    );
  }
}
