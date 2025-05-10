import 'package:fc_ai_circle/src/app/external_links.dart';
import 'package:jaspr/browser.dart';

class TakeSurvey extends StatelessComponent {
  const TakeSurvey({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield a(
      href: ExternalLink.surveyCommunity.url,
      target: Target.blank,
      classes: 'cta_button',
      [text('Take the Survey')],
    );
  }
}
