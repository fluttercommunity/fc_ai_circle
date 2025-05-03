import 'package:jaspr/browser.dart';

class TakeSurvey extends StatelessComponent {
  const TakeSurvey({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield a(
      href: '/take_survey',
      classes: 'cta_button',
      [text('Take the Survey')],
    );
  }
}
