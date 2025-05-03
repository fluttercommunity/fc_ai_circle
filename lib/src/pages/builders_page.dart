import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';

class BuildersPage extends StatelessComponent {
  const BuildersPage({super.key});

  static Route route() {
    return Route(
      path: '/builders',
      title: 'Builders',
      builder: (BuildContext context, RouteState state) => BuildersPage(),
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield PageLayout(
      child: h1(
        [text('Builders')],
      ),
    );
  }
}
