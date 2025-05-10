import 'package:fc_ai_circle/src/components/content_section.dart';
import 'package:fc_ai_circle/src/components/page_hero.dart';
import 'package:fc_ai_circle/src/components/resource_link.dart';
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
          elevated: true,
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
              isHighlighted: true,
            ),
            _FeatureCard(
              title: 'Build Tools',
              description: 'Open-source packages and utilities to simplify AI integration',
            ),
            _FeatureCard(
              title: 'Provide Templates',
              description: 'Ready-to-use starter projects for common AI tasks',
              isHighlighted: true,
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
      emoji: '🚀',
      children: [
        ContentCard(
          elevated: true,
          children: [
            p([
              text(
                'We\'re currently preparing our community platforms. Join us to collaborate, '
                'learn, and build the future of AI-powered Flutter apps.',
              )
            ]),
            div(
              classes: 'coming-next-content',
              [
                div(
                  classes: 'volunteer-note',
                  [
                    span(
                      classes: 'emoji',
                      [text('🔔')],
                    ),
                    p([
                      text(
                        'Sign up for our newsletter to get notified when our community platforms are ready.',
                      ),
                    ]),
                  ],
                ),
              ],
            ),
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
        ResourceCategory(
          title: 'Ways to Contribute',
          accent: CategoryAccent.blue,
          useGrid: true,
          resources: [
            ResourceLink(
              emoji: '📝',
              title: 'Write Documentation',
              description: 'Help create clear guides, examples, and tutorials.',
              link: '#',
              variant: CardVariant.blueGlow,
            ),
            ResourceLink(
              emoji: '🧪',
              title: 'Create Example Apps',
              description: 'Build sample projects demonstrating AI integration patterns.',
              link: '#',
              variant: CardVariant.highlighted,
            ),
            ResourceLink(
              emoji: '🔍',
              title: 'Review Code',
              description: 'Help ensure quality and consistency in our code samples.',
              link: '#',
            ),
            ResourceLink(
              emoji: '🌐',
              title: 'Spread the Word',
              description: 'Share our resources with your network and community.',
              link: '#',
            ),
          ],
        ),
        p(
          classes: 'section-description',
          [text('PRs welcome - watch this space for contribution guidelines.')],
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessComponent {
  const _FeatureCard({
    required this.title,
    required this.description,
    this.isHighlighted = false,
  });

  final String title;
  final String description;
  final bool isHighlighted;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: isHighlighted ? 'feature-card highlighted' : 'feature-card',
      attributes: {'role': 'listitem'},
      [
        h3([text(title)]),
        p([text(description)]),
      ],
    );
  }
}
