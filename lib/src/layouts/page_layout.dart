import 'package:fc_ai_circle/src/components/footer.dart';
import 'package:fc_ai_circle/src/components/navbar.dart';
import 'package:jaspr/browser.dart';

class PageLayout extends StatelessComponent {
  const PageLayout({
    super.key,
    required this.children,
  });

  final Iterable<Component> children;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'site-frame',
      [
        Navbar(),
        div(
          classes: 'page-layout container',
          [...children],
        ),
        Footer(),
      ],
    );
  }
}
