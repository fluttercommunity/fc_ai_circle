import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';

class BuildersPage extends StatelessComponent {
  const BuildersPage({super.key});

  static const path = '/builders';

  static Iterable<Route> route() sync* {
    yield Route(
      path: path,
      title: 'Builders - Flutter AI Builders Circle',
      builder: (BuildContext context, RouteState state) => BuildersPage(),
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield PageLayout(
      children: [
        _HeroSection(),
        _AboutSection(),
        _MissionSection(),
        _WhatWeDoSection(),
        _JoinSection(),
        _ContributorsSection(),
      ],
    );
  }
}

class _HeroSection extends StatelessComponent {
  const _HeroSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      classes: 'hero',
      attributes: {'role': 'banner'},
      [
        div(classes: 'container', [
          h1(
            classes: 'page-title',
            [
              span(
                classes: 'title-text',
                [text('Builders')],
              ),
            ],
          ),
          p([
            text(
              'An open-source, volunteer-led community focused on integrating AI capabilities '
              'into Flutter applications.',
            )
          ]),
        ]),
      ],
    );
  }
}

class _AboutSection extends StatelessComponent {
  const _AboutSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: 'about',
      attributes: {'role': 'region', 'aria-label': 'About Us'},
      [
        div(classes: 'container', [
          h2(classes: 'section-title', [text('About Us')]),
          p([
            text(
              'We bring together Flutter developers interested in building agentic apps using '
              'cutting-edge technologies like Gemini, Whisper, Multimodal Content Processing (MCP), '
              'and Retrieval-Augmented Generation (RAG).',
            )
          ]),
        ]),
      ],
    );
  }
}

class _MissionSection extends StatelessComponent {
  const _MissionSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: 'mission',
      attributes: {'role': 'region', 'aria-label': 'Our Mission'},
      [
        div(classes: 'container', [
          h2(classes: 'section-title', [text('Our Mission 🎯')]),
          ul([
            li([
              text(
                'Create accessible resources for Flutter developers to incorporate AI into their apps',
              )
            ]),
            li([text('Explore and share best practices for responsible AI implementation')]),
            li([text('Build a supportive community for experimentation and learning')]),
            li([text('Develop open-source starter kits and reference implementations')]),
          ]),
        ]),
      ],
    );
  }
}

class _WhatWeDoSection extends StatelessComponent {
  const _WhatWeDoSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: 'what-we-do',
      attributes: {'role': 'region', 'aria-label': 'What We Do'},
      [
        div(classes: 'container', [
          h2(classes: 'section-title', [text('What We Do 📦')]),
          div(
            classes: 'features-grid',
            attributes: {'role': 'list'},
            [
              _FeatureCard(
                title: 'Share Knowledge',
                description: 'Technical articles, code examples, and implementation guides',
              ),
              _FeatureCard(
                title: 'Build Tools',
                description: 'Open-source packages and utilities to simplify AI integration',
              ),
              _FeatureCard(
                title: 'Provide Templates',
                description: 'Ready-to-use starter projects for common AI tasks',
              ),
              _FeatureCard(
                title: 'Foster Collaboration',
                description: 'Connect developers working on similar challenges',
              ),
            ],
          ),
        ]),
      ],
    );
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
      attributes: {'role': 'listitem'},
      [
        h3([text(title)]),
        p([text(description)]),
      ],
    );
  }
}

class _JoinSection extends StatelessComponent {
  const _JoinSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: 'join',
      attributes: {'role': 'region', 'aria-label': 'Join Us'},
      [
        div(classes: 'container', [
          h2(classes: 'section-title', [text('Join Us')]),
          p([
            text(
              'We\'re currently preparing our community platforms. Join us to collaborate, '
              'learn, and build the future of AI-powered Flutter apps.',
            )
          ]),
        ]),
      ],
    );
  }
}

class _ContributorsSection extends StatelessComponent {
  const _ContributorsSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: 'contributors',
      attributes: {'role': 'region', 'aria-label': 'Want to Contribute'},
      [
        div(classes: 'container', [
          h2(classes: 'section-title', [text('Want to Contribute? 🔗')]),
          p([
            text(
              'We welcome contributions from Flutter developers of all experience levels! '
              'Whether you\'re an AI expert or just getting started, there\'s a place for '
              'you in our community.',
            )
          ]),
          p([text('PRs welcome - watch this space for contribution guidelines.')]),
        ]),
      ],
    );
  }
}
