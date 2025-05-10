import 'package:fc_ai_circle/src/pages/builders_page.dart';
import 'package:fc_ai_circle/src/pages/home_page.dart';
import 'package:fc_ai_circle/src/pages/starters_page.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';

class Website extends StatefulComponent {
  const Website({super.key});

  @override
  State<Website> createState() => _SiteState();
}

class _SiteState extends State<Website> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Document.head(
      children: [
        link(href: '/css/fontawesome.css', rel: 'stylesheet'),
        link(href: '/css/brands.css', rel: 'stylesheet'),
        // Style(styles: resetStyles)
      ],
    );
    yield Router(
      routes: [
        ...HomePage.route(),
        ...StartersPage.route(),
        ...BuildersPage.route(),
      ],
    );
  }
}
