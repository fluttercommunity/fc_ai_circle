import 'package:jaspr/browser.dart';
import 'home_page.dart';
import 'navbar.dart';
import 'footer.dart';

class App extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'div',
      classes: 'app-wrapper',
      children: [
        Navbar(),
        HomePage(),
        Footer(),
      ],
    );
  }
}
