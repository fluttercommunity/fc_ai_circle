import 'package:jaspr/browser.dart';

/// A card displaying a feature with title, description and optional emoji.
///
/// Used to display key capabilities or offerings in a uniform grid layout.
class FeatureCard extends StatelessComponent {
  const FeatureCard({
    super.key,
    required this.title,
    required this.description,
    this.isHighlighted = false,
    this.emoji,
  });

  /// The title displayed at the top of the card
  final String title;

  /// A short description of the feature
  final String description;

  /// Whether to apply highlighted styling to this card
  final bool isHighlighted;

  /// An optional emoji to display before the title
  final String? emoji;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: isHighlighted ? 'feature-card highlighted' : 'feature-card',
      attributes: {'role': 'listitem'},
      [
        h3([
          if (emoji != null)
            span(classes: 'feature-emoji', attributes: {'aria-hidden': 'true'}, [text('$emoji ')]),
          text(title),
        ]),
        p([text(description)]),
      ],
    );
  }
}
