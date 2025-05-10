import 'package:fc_ai_circle/src/components/take_survey.dart';
import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:fc_ai_circle/src/pages/builders_page.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  static const path = '/';

  static Iterable<Route> route() sync* {
    yield Route(
      path: '/index.html',
      title: 'Welcome',
      builder: (BuildContext context, RouteState state) => HomePage(),
    );
    yield Route(
      path: '/',
      title: 'Welcome',
      builder: (BuildContext context, RouteState state) => HomePage(),
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield PageLayout(
      children: [
        _HeroSection(),
        _FeaturesSection(),
        _CtaSection(),
        _FaqSection(),
      ],
    );
  }
}

class _HeroSection extends StatelessComponent {
  const _HeroSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(classes: 'hero', [
      div(classes: 'container', [
        h1(
          classes: 'page-title',
          [
            span(
              classes: 'title-text',
              [text('Build Agentic Flutter Experiences')],
            ),
          ],
        ),
        p([
          text(
            'A community-powered space for developers building '
            'with AI, agentic apps, and next-gen Flutter workflows.',
          )
        ]),
        div(classes: 'buttons-container', [
          a(
            classes: 'cta_button',
            href: BuildersPage.path,
            onClick: () => Router.of(context).push(BuildersPage.path),
            [text('Explore Builders')],
          ),
          a(
            classes: 'secondary-button',
            href: '#',
            // TODO: Add link to "What is Agentic Flutter?" page once created
            [text('What is Agentic Flutter?')],
          ),
        ]),
      ]),
    ]);
  }
}

class _FeaturesSection extends StatelessComponent {
  const _FeaturesSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // TODO: (maybe/extra) Add scroll-based animation to reveal this section when it enters viewport
    yield section(id: 'features', [
      div(classes: 'container', [
        h2(
          classes: 'section-title',
          [text('Highlights from the Flutter Community AI Circle')],
        ),
        div(classes: 'features-grid', [
          // TODO: Add YouTube video embed for past livestream
          _FeatureCard(
            title: 'Past Livestream',
            description: 'Vibe Coding a Card Game with Norbert & Friends',
          ),
          // TODO: Add calendar integration or dynamic content for upcoming events
          //  - can they add them to their calendar or directly go set a reminder?
          _FeatureCard(
            title: 'Upcoming',
            description: 'Humpday Q&A: Agentic Apps Spotlight',
          ),
          // TODO: Add link to survey form/ or forms - maybe regular community one idk.
          _FeatureCard(
            title: 'Survey',
            description: 'Help shape open-source tooling for AI in Flutter',
          ),
        ]),
      ]),
    ]);
  }
}

class _FeatureCard extends StatelessComponent {
  const _FeatureCard({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'feature-card',
      [
        h3([text(title)]),
        p([text(description)]),
      ],
    );
  }
}

class _CtaSection extends StatelessComponent {
  const _CtaSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // TODO:(maybe/extra)  Add scroll-based fade-in animation for this section
    yield section(classes: 'cta-section', [
      div(classes: 'container', [
        h2(
          classes: 'section-title',
          [text('Your voice shapes the future of AI in Flutter.')],
        ),
        p([
          text(
            'Take our community survey and help us understand how AI is changing '
            'the way we code, collaborate, and create.',
          ),
        ]),
        TakeSurvey(),
      ]),
    ]);
  }
}

class _FaqSection extends StatelessComponent {
  const _FaqSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    // TODO:(maybe/extra) Implement intersection observer to animate FAQ items sequentially as they come into view
    yield section(id: 'faq', [
      div(classes: 'container', [
        h2(
          classes: 'section-title',
          styles: Styles(raw: {
            'text-align': 'center',
            'margin-bottom': 'var(--spacing-lg)',
          }),
          [text('Frequently Asked Questions')],
        ),
        _FaqItem(
          question: 'What is the Flutter Community AI Circle?',
          answer: 'The Flutter Community AI Circle is a community initiative focused on exploring '
              'and developing AI-powered capabilities within Flutter apps. We bring '
              'together developers interested in building agentic experiences, leveraging '
              'AI models, and advancing Flutter\'s potential in this space.',
        ),
        _FaqItem(
          question: 'Who can join this community?',
          answer: 'Anyone interested in the intersection of Flutter and AI is welcome! Whether '
              'you\'re a beginner curious about AI capabilities or an experienced developer '
              'working on complex agentic apps, this community is for you. We value '
              'diverse perspectives and experience levels.',
        ),
        _FaqItem(
          question: 'How can I contribute to the Flutter Community AI Circle?',
          answer: 'There are many ways to contribute: participate in our surveys, join live coding '
              'sessions, share your projects in our forums, contribute to open-source '
              'repositories, or help document best practices. Reach out through any of '
              'our channels to get involved!',
        ),
      ]),
    ]);
  }
}

class _FaqItem extends StatelessComponent {
  const _FaqItem({
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'faq-item',
      [
        h3([text(question)]),
        p([text(answer)]),
      ],
    );
  }
}
