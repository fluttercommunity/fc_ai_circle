import 'package:fc_ai_circle/src/components/content_section.dart';
import 'package:fc_ai_circle/src/components/feature_card.dart';
import 'package:fc_ai_circle/src/components/page_hero.dart';
import 'package:fc_ai_circle/src/components/resource_link.dart';
import 'package:fc_ai_circle/src/components/resource_category.dart';
import 'package:fc_ai_circle/src/components/survey_callout.dart';
import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:fc_ai_circle/src/app/external_links.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';

/// The Builders page showcases the community's purpose, mission and resources.
class BuildersPage extends StatelessComponent {
  const BuildersPage({super.key});

  static const path = '/builders';

  /// Defines the routing for this page
  static Iterable<Route> route() sync* {
    yield Route(
      path: path,
      title: 'Builders - Flutter AI Builders Circle',
      builder: (BuildContext context, RouteState state) => const BuildersPage(),
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
        const SurveyCallout(), // Using our new component
        _buildContributorsSection(context),
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
                'Join us in creating agentic Flutter applications with advanced LLM integration, multimodal processing, and cutting-edge tools.')
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
                  'We bring together Flutter developers interested in building agentic apps using cutting-edge technologies like Gemini, Claude, OpenAI, Whisper, Multimodal Content Processing (MCP), and Retrieval-Augmented Generation (RAG).')
            ]),
            p([
              text(
                  'Our community builds on the official Flutter ecosystem while exploring innovative ways to integrate AI into mobile and web applications.')
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
        ResourceCategory(
          title: 'Community Goals',
          accent: CategoryAccent.purple,
          useGrid: true,
          resources: [
            ResourceLink(
              title: 'Accessible Resources',
              description:
                  'Create clear documentation, tutorials, and examples for Flutter developers to incorporate AI into their apps',
              url: ExternalLink.forumCategory.url,
            ),
            ResourceLink(
              title: 'Best Practices',
              description:
                  'Explore and share responsible AI implementation patterns with the community',
              url: ExternalLink.youTubeAgenticQA.url,
            ),
            ResourceLink(
              title: 'Supportive Environment',
              description:
                  'Build a welcoming community for experimentation, learning, and collaboration',
              url: ExternalLink.forumChat.url,
            ),
            ResourceLink(
              title: 'Open Source',
              description: 'Develop starter kits, reference implementations, and shared resources',
              url: ExternalLink.socialGitHub.url,
            ),
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
            FeatureCard(
              title: 'Share Knowledge',
              description: 'Technical articles, code examples, and implementation guides',
              isHighlighted: true,
              emoji: '📚',
            ),
            FeatureCard(
              title: 'Build Tools',
              description: 'Open-source packages and utilities to simplify AI integration',
              emoji: '🔧',
            ),
            FeatureCard(
              title: 'Provide Templates',
              description: 'Ready-to-use starter projects for common AI tasks',
              isHighlighted: true,
              emoji: '📋',
            ),
            FeatureCard(
              title: 'Foster Collaboration',
              description: 'Connect developers working on similar challenges',
              emoji: '🤝',
            ),
          ],
        ),
        div(classes: 'section-spacer', []),
        ContentSection(
          title: 'YouTube Content',
          emoji: '💡',
          contentPadding: false,
          children: [
            p([text('Interested in building with Flutter and AI? Check out our YouTube content:')]),
            ResourceCategory(
              useGrid: true,
              accent: CategoryAccent.purple,
              title: 'YouTube Resources',
              resources: [
                ResourceLink(
                  title: 'AI Circle Playlist',
                  description: 'Collection of our community sessions and tutorials',
                  url: ExternalLink.youTubePlaylist.url,
                ),
                ResourceLink(
                  title: 'Vibe Coding Sessions',
                  description: 'Relaxed coding streams building AI-powered apps',
                  url: ExternalLink.youTubeVibeCoding.url,
                ),
                ResourceLink(
                  title: 'Agentic Q&A Session',
                  description: 'Deep dive into agentic app patterns',
                  url: ExternalLink.youTubeAgenticQA.url,
                ),
              ],
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
          title: 'Essential Resources',
          accent: CategoryAccent.purple,
          useGrid: true,
          resources: [
            ResourceLink(
              title: 'Function Calling with Gemini',
              description:
                  'Official documentation for implementing function calling with Gemini AI',
              url: ExternalLink.geminiFunctionCallingDocs.url,
            ),
            ResourceLink(
              title: 'MCP for Flutter Developers',
              description: 'Understanding the Model Context Protocol for Flutter applications',
              url: ExternalLink.youTubeJhinLeeMCPHumpdayQA.url,
            ),
          ],
        ),
        ResourceCategory(
          title: 'Community Channels',
          accent: CategoryAccent.green,
          useGrid: true,
          resources: [
            ResourceLink(
              title: 'YouTube Channel',
              description: 'Tutorials, livestreams, and coding sessions from our community',
              url: ExternalLink.youTubeFlutterCommunity.url,
            ),
            ResourceLink(
              title: 'Flutter Forum',
              description: 'Discussions, Q&A, and knowledge sharing about Flutter and AI',
              url: ExternalLink.forumCategory.url,
            ),
            ResourceLink(
              title: 'Community Survey',
              description: 'Help shape the future of our community by sharing your feedback',
              url: ExternalLink.surveyCommunity.url,
            ),
          ],
        ),
      ],
    );
  }

  Component _buildContributorsSection(BuildContext context) {
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
              title: 'Write Documentation',
              description: 'Help create clear guides, examples, and tutorials for the community',
              url: ExternalLink.socialGitHub.url,
            ),
            ResourceLink(
              title: 'Create Example Apps',
              description: 'Build sample projects demonstrating AI integration patterns',
              url: ExternalLink.socialGitHub.url,
            ),
            ResourceLink(
              title: 'Review Code',
              description: 'Help ensure quality and consistency in our code samples',
              url: ExternalLink.socialGitHub.url,
            ),
            ResourceLink(
              title: 'Spread the Word',
              description: 'Share our resources with your network and community',
              url: ExternalLink.surveyCommunity.url,
            ),
          ],
        ),
        ContentCard(
          elevated: true,
          animateCta: true,
          children: [
            div(
              classes: 'volunteer-note',
              [
                span(classes: 'emoji', attributes: {'aria-hidden': 'true'}, [text('✋')]),
                h3([text('Ready to contribute?')]),
                p([
                  text(
                      'Take our contributor survey to let us know how you\'d like to participate. We\'re looking for writers, coders, reviewers, and community advocates.')
                ]),
              ],
            ),
            p([
              text('Check out our '),
              a(
                href: '/starters',
                classes: 'highlight-link',
                onClick: () => Router.of(context).push('/starters'),
                [text('Starters')],
              ),
              text(' section for inspiration and examples to build upon.'),
            ]),
            div(
              classes: 'buttons-container',
              [
                a(
                  href: ExternalLink.surveyContributors.url,
                  target: Target.blank,
                  attributes: {'rel': 'noopener noreferrer'},
                  classes: 'cta_button',
                  [
                    span([text('Take Contributor Survey')])
                  ],
                ),
                a(
                  href: ExternalLink.socialGitHub.url,
                  target: Target.blank,
                  attributes: {'rel': 'noopener noreferrer'},
                  classes: 'secondary-button',
                  [
                    span([text('GitHub Repository')])
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
