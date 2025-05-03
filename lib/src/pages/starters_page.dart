import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';

class StartersPage extends StatelessComponent {
  const StartersPage({super.key});

  static Route route() {
    return Route(
      path: '/starters',
      title: 'Starters',
      builder: (BuildContext context, RouteState state) => StartersPage(),
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield PageLayout(
      child: h1(
        [text('Starters')],
      ),
    );
  }
}
