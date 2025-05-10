import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';

class StartersPage extends StatelessComponent {
  const StartersPage({super.key});

  static var path = '/starters';

  static Route route() {
    return Route(
      path: path,
      title: 'Starters',
      builder: (BuildContext context, RouteState state) => StartersPage(),
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield PageLayout(
      children: [
        h1([text('Starters')]),
      ],
    );
  }
}
