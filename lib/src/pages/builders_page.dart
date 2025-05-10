import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';

class BuildersPage extends StatelessComponent {
  const BuildersPage({super.key});

  static var path = '/builders';

  static Route route() {
    return Route(
      path: path,
      title: 'Builders',
      builder: (BuildContext context, RouteState state) => BuildersPage(),
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield PageLayout(
      children: [
        h1([text('Builders')]),
        h2([text('Our Mission 🎯')]),
        p([text('We aim to:')]),
        ul([
          li([
            text('Create accessible resources for Flutter developers '
                'to incorporate AI into their apps')
          ]),
          li([text('Explore and share best practices for responsible AI implementation')]),
          li([text('Build a supportive community for experimentation and learning')]),
          li([text('Develop open-source starter kits and reference implementations')]),
        ]),
      ],
    );
  }
}
