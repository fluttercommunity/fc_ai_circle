import 'package:fc_ai_circle/src/components/content_section.dart';
import 'package:fc_ai_circle/src/components/page_hero.dart';
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
        _buildHeroSection(),
        _buildAboutSection(),
        _buildMissionSection(),
        _buildWhatWeDoSection(),
        _buildJoinSection(),
        _buildContributorsSection(),
      ],
    );
  }

  Component _buildHeroSection() {
    return PageHero(
      title: 'Builders',
      description: 'An open-source, volunteer-led community focused on integrating AI capabilities '
          'into Flutter applications.',
    );
  }

  Component _buildAboutSection() {
    return ContentSection(
      title: 'About Us',
      id: 'about',
      children: [
        ContentCard(
          children: [
            p([
              text(
                'We bring together Flutter developers interested in building agentic apps using '
                'cutting-edge technologies like Gemini, Whisper, Multimodal Content Processing (MCP), '
                'and Retrieval-Augmented Generation (RAG).',
              )
            ]),
          ],
        ),
      ],
    );
  }

  Component _buildMissionSection() {
    return ContentSection(
      title: 'Our Mission',
      id: 'mission',
      emoji: '🎯',
      children: [
        ContentCard(
          children: [
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
          ],
        ),
      ],
    );
  }

  Component _buildWhatWeDoSection() {
    return ContentSection(
      title: 'What We Do',
      id: 'what-we-do',
      emoji: '📦',
      children: [
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
      ],
    );
  }

  Component _buildJoinSection() {
    return ContentSection(
      title: 'Join Us',
      id: 'join',
      children: [
        ContentCard(
          children: [
            p([
              text(
                'We\'re currently preparing our community platforms. Join us to collaborate, '
                'learn, and build the future of AI-powered Flutter apps.',
              )
            ]),
          ],
        ),
      ],
    );
  }

  Component _buildContributorsSection() {
    return ContentSection(
      title: 'Want to Contribute?',
      id: 'contributors',
      emoji: '🔗',
      children: [
        ContentCard(
          children: [
            p([
              text(
                'We welcome contributions from Flutter developers of all experience levels! '
                'Whether you\'re an AI expert or just getting started, there\'s a place for '
                'you in our community.',
              )
            ]),
            p([text('PRs welcome - watch this space for contribution guidelines.')]),
          ],
        ),
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
