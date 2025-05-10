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
        _buildToolkitSection(),
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
      callout: EmojiCallout(
        emoji: '🚀',
        children: [
          p([
            text(
              'Join us in creating agentic Flutter applications with advanced LLM integration, multimodal processing, and cutting-edge tools.',
            ),
          ]),
        ],
      ),
    );
  }

  Component _buildAboutSection() {
    return ContentSection(
      title: 'About Us',
      id: 'about',
      emoji: '🌟',
      description: 'We connect Flutter developers building with modern AI capabilities.',
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
              emoji: '📚',
            ),
            _FeatureCard(
              title: 'Build Tools',
              description: 'Open-source packages and utilities to simplify AI integration',
              emoji: '🔧',
            ),
            _FeatureCard(
              title: 'Provide Templates',
              description: 'Ready-to-use starter projects for common AI tasks',
              isHighlighted: true,
              emoji: '📋',
            ),
            _FeatureCard(
              title: 'Foster Collaboration',
              description: 'Connect developers working on similar challenges',
              emoji: '🤝',
            ),
          ],
        ),
      ],
    );
  }

  Component _buildToolkitSection() {
    return ContentSection(
      title: 'Builder\'s Toolkit',
      id: 'toolkit',
      emoji: '🧰',
      description: 'Resources and tools to help you build agentic Flutter applications.',
      children: [
        ResourceCategory(
          title: 'Essential Tools',
          accent: CategoryAccent.purple,
          useGrid: true,
          resources: [
            ResourceLink(
              emoji: '🔄',
              title: 'Function Calling Patterns',
              description: 'Reference implementations of function calling with Gemini and Claude.',
              link: '#',
              variant: CardVariant.highlighted,
            ),
            ResourceLink(
              emoji: '🔍',
              title: 'RAG Implementation Guide',
              description: 'Step-by-step guide to implementing retrieval-augmented generation.',
              link: '#',
              variant: CardVariant.blueGlow,
            ),
          ],
        ),
        ResourceCategory(
          title: 'Advanced Workflows',
          accent: CategoryAccent.green,
          useHorizontalScroll: true,
          resources: [
            ResourceLink(
              emoji: '🧠',
              title: 'Agent Orchestration',
              description: 'Patterns for coordinating multiple AI agents in a Flutter app.',
              link: '#',
              variant: CardVariant.highlighted,
            ),
            ResourceLink(
              emoji: '📱',
              title: 'On-Device LLM Integration',
              description: 'Guide to running smaller language models locally in Flutter.',
              link: '#',
              variant: CardVariant.greenGlow,
            ),
            ResourceLink(
              emoji: '🔊',
              title: 'Voice Input Processing',
              description: 'Integrating speech recognition with LLM processing pipelines.',
              link: '#',
            ),
            ResourceLink(
              emoji: '📷',
              title: 'Vision + LLM',
              description: 'Combining image processing with language model understanding.',
              link: '#',
              variant: CardVariant.orangeGlow,
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
      emoji: '✨',
      elevated: true,
      children: [
        ContentCard(
          elevated: true,
          animateCta: true,
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
                div(
                  classes: 'buttons-container',
                  [
                    a(
                      href: '#',
                      classes: 'cta_button',
                      [
                        span([text('Join the Community')]),
                      ],
                    ),
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
      elevated: true,
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
        ContentCard(
          children: [
            p(
              classes: 'section-description',
              [text('PRs welcome - watch this space for contribution guidelines.')],
            ),
            p([
              text('Check out our '),
              a(
                href: '/starters',
                classes: 'highlight-link',
                [text('Starters')],
              ),
              text(' section for inspiration and examples to build upon.'),
            ]),
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
    this.isHighlighted = false,
    this.emoji,
  });

  final String title;
  final String description;
  final bool isHighlighted;
  final String? emoji;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: isHighlighted ? 'feature-card highlighted' : 'feature-card',
      attributes: {'role': 'listitem'},
      [
        h3([
          if (emoji != null) span(classes: 'feature-emoji', [text('$emoji ')]),
          text(title),
        ]),
        p([text(description)]),
      ],
    );
  }
}
