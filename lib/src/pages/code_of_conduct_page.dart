import 'package:jaspr/ui.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:fc_ai_circle/src/components/content_section.dart';

class CodeOfConductPage extends StatelessComponent {
  const CodeOfConductPage({super.key});

  static const path = '/code-of-conduct';

  static Iterable<Route> route() sync* {
    yield Route(
      path: path,
      title: 'Code of Conduct - Flutter Community AI Circle',
      builder: (BuildContext context, RouteState state) => CodeOfConductPage(),
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield PageLayout(
      children: [
        ContentSection(
          title: 'Code of Conduct',
          children: [
            p([
              text(
                'Flutter Community AI Circle members are dedicated to providing a harassment-free and inclusive experience '
                'for everyone regardless of gender identity and expression, sexual orientation, '
                'disabilities, neurodiversity, physical appearance, body size, ethnicity, '
                'nationality, race, age, religion, or other protected category.',
              )
            ]),
            p(
              [
                text(
                  'Flutter Community AI Circle follows the ',
                ),
                a(
                  href: 'https://flutter.dev/culture',
                  target: Target.blank,
                  [text('Google Flutter Culture of Inclusivity policies')],
                ),
                text('.'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
