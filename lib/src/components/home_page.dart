import 'package:jaspr/browser.dart';

class HomePage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'div',
      classes: 'home-page',
      children: [
        _heroSection(),
        _featuresSection(),
        _ctaSection(),
        _faqSection(),
      ],
    );
  }

  Component _heroSection() {
    return DomComponent(
      tag: 'section',
      classes: 'hero',
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          children: [
            DomComponent(
              tag: 'h1',
              child: Text('Build Agentic Flutter Experiences'),
            ),
            DomComponent(
              tag: 'p',
              child: Text(
                  'A community-powered space for developers building with AI, agentic apps, and next-gen Flutter workflows.'),
            ),
            DomComponent(
              tag: 'div',
              classes: 'buttons-container',
              children: [
                DomComponent(
                  tag: 'a',
                  classes: 'cta_button',
                  attributes: {'href': '#'},
                  child: Text('Explore Builders'),
                ),
                DomComponent(
                  tag: 'a',
                  classes: 'secondary-button',
                  attributes: {'href': '#'},
                  child: Text('What is Agentic Flutter?'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _featuresSection() {
    // TODO: (maybe/extra) Add scroll-based animation to reveal this section when it enters viewport
    return DomComponent(
      tag: 'section',
      id: 'features',
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          children: [
            DomComponent(
              tag: 'h2',
              classes: 'section-title',
              child: Text('Highlights from the Flutter Community AI Circle'),
            ),
            DomComponent(
              tag: 'div',
              classes: 'features-grid',
              children: [
                // TODO: Add YouTube video embed for past livestream
                _featureCard('Past Livestream', 'Vibe Coding a Card Game with Norbert & Friends'),
                // TODO: Add calendar integration or dynamic content for upcoming events - can they add them to their calendar or directly go set a reminder?
                _featureCard('Upcoming', 'Humpday Q&A: Agentic Apps Spotlight'),
                // TODO: Add link to survey form/ or forms - maybe regular community one idk.
                _featureCard('Survey', 'Help shape open-source tooling for AI in Flutter'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _featureCard(String title, String description) {
    return DomComponent(
      tag: 'div',
      classes: 'feature-card',
      children: [
        DomComponent(
          tag: 'h3',
          child: Text(title),
        ),
        DomComponent(
          tag: 'p',
          child: Text(description),
        ),
      ],
    );
  }

  Component _ctaSection() {
    // TODO:(maybe/extra)  Add scroll-based fade-in animation for this section
    return DomComponent(
      tag: 'section',
      classes: 'cta-section',
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          children: [
            DomComponent(
              tag: 'h2',
              classes: 'section-title',
              child: Text('Your voice shapes the future of AI in Flutter.'),
            ),
            DomComponent(
              tag: 'p',
              child: Text(
                'Take our community survey and help us understand how AI is changing the way we code, collaborate, and create.',
              ),
            ),
            DomComponent(
              tag: 'a',
              classes: 'cta_button',
              attributes: {'href': '#'},
              child: Text('Take the Survey'),
            ),
          ],
        ),
      ],
    );
  }

  Component _faqSection() {
    // TODO:(maybe/extra) Implement intersection observer to animate FAQ items sequentially as they come into view
    return DomComponent(
      tag: 'section',
      id: 'faq',
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          children: [
            DomComponent(
              tag: 'h2',
              classes: 'section-title',
              styles: Styles(raw: {
                'text-align': 'center',
                'margin-bottom': 'var(--spacing-lg)',
              }),
              child: Text('Frequently Asked Questions'),
            ),
            _faqItem('What is the Flutter Community AI Circle?',
                'The Flutter Community AI Circle is a community initiative focused on exploring and developing AI-powered capabilities within Flutter apps. We bring together developers interested in building agentic experiences, leveraging AI models, and advancing Flutter\'s potential in this space.'),
            _faqItem('Who can join this community?',
                'Anyone interested in the intersection of Flutter and AI is welcome! Whether you\'re a beginner curious about AI capabilities or an experienced developer working on complex agentic apps, this community is for you. We value diverse perspectives and experience levels.'),
            _faqItem('How can I contribute to the Flutter Community AI Circle?',
                'There are many ways to contribute: participate in our surveys, join live coding sessions, share your projects in our forums, contribute to open-source repositories, or help document best practices. Reach out through any of our channels to get involved!'),
          ],
        ),
      ],
    );
  }

  Component _faqItem(String question, String answer) {
    return DomComponent(
      tag: 'div',
      classes: 'faq-item',
      children: [
        DomComponent(
          tag: 'h3',
          child: Text(question),
        ),
        DomComponent(
          tag: 'p',
          child: Text(answer),
        ),
      ],
    );
  }
}
