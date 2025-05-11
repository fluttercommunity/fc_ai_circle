import 'package:fc_ai_circle/src/components/take_survey.dart';
import 'package:jaspr/browser.dart';

/// A callout section that prompts users to participate in the community survey.
///
/// This component creates a visually distinct card with a title, description,
/// and a call-to-action button to take the survey.
class SurveyCallout extends StatelessComponent {
  /// Creates a survey callout with customizable title and description.
  const SurveyCallout({
    super.key,
    this.title = 'Shape Our Community!',
    this.description =
        'Be part of our growing community of Flutter developers exploring AI integration. Share your knowledge, learn from others, and build the future of AI-powered Flutter apps.',
    this.emoji = '🔔',
    this.buttonText = 'Take the Survey',
    this.isPulsing = true,
  });

  /// The headline text for the survey callout
  final String title;

  /// The descriptive text explaining the survey's purpose
  final String description;

  /// The emoji displayed beside the title
  final String emoji;

  /// The text for the call-to-action button
  final String buttonText;

  /// Whether the button should have a pulsing animation
  final bool isPulsing;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'survey-callout-container',
      [
        div(
          classes: 'survey-callout',
          [
            // Title section with emoji
            div(
              classes: 'survey-header',
              [
                span(
                  classes: 'emoji large-emoji',
                  attributes: {'aria-hidden': 'true'},
                  [text(emoji)],
                ),
                h2(classes: 'survey-title', [text(title)]),
              ],
            ),
            // Description
            p(
              classes: 'survey-description',
              [text(description)],
            ),
            // Button container
            div(
              classes: 'buttons-container centered-buttons',
              [
                // Use the enhanced TakeSurvey component directly
                TakeSurvey(
                  buttonText: buttonText,
                  additionalClasses: isPulsing ? 'pulse-button' : '',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
