import 'package:fc_ai_circle/src/app/external_links.dart';
import 'package:jaspr/browser.dart';

/// A button component that links to the community survey.
class TakeSurvey extends StatelessComponent {
  /// Creates a survey button with customizable text and additional classes.
  const TakeSurvey({
    super.key,
    this.buttonText = 'Take the Survey',
    this.additionalClasses = '',
  });

  /// The text to display on the button
  final String buttonText;

  /// Additional CSS classes to apply to the button
  final String additionalClasses;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield a(
      href: ExternalLink.surveyCommunity.url,
      target: Target.blank,
      attributes: {'rel': 'noopener noreferrer'},
      classes: 'cta_button ${additionalClasses.isNotEmpty ? additionalClasses : ''}',
      [text(buttonText)],
    );
  }
}
