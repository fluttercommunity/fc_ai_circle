import 'package:fc_ai_circle/src/pages/builders_page.dart';
import 'package:fc_ai_circle/src/pages/home_page.dart';
import 'package:fc_ai_circle/src/pages/starters_page.dart';
import 'package:fc_ai_circle/src/pages/privacy_policy_page.dart';
import 'package:fc_ai_circle/src/pages/code_of_conduct_page.dart';
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
        link(href: '/css/clickable-cards.css', rel: 'stylesheet'),
        script(src: '/js/scroll.js', attributes: {'defer': 'true'}, []),
        script(src: '/js/clickable-cards.js', attributes: {'defer': 'true'}, []),
      ],
    );
    yield Router(
      routes: [
        ...HomePage.route(),
        ...StartersPage.route(),
        ...BuildersPage.route(),
        ...PrivacyPolicyPage.route(),
        ...CodeOfConductPage.route(),
      ],
    );
  }
}
