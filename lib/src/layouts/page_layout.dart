import 'package:fc_ai_circle/src/components/footer.dart';
import 'package:fc_ai_circle/src/components/navbar.dart';
import 'package:jaspr/browser.dart';

class PageLayout extends StatelessComponent {
  const PageLayout({
    super.key,
    required this.child,
  });

  final Component child;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'div',
      classes: 'app-wrapper',
      children: [
        Navbar(),
        child,
        Footer(),
      ],
    );
  }
}
