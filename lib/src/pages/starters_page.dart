import 'package:fc_ai_circle/src/components/content_section.dart';
import 'package:fc_ai_circle/src/components/page_hero.dart';
import 'package:fc_ai_circle/src/components/resource_link.dart';
import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';

class StartersPage extends StatelessComponent {
  const StartersPage({super.key});

  static const path = '/starters';

  static Iterable<Route> route() sync* {
    yield Route(
      path: path,
      title: 'Starters - Flutter AI Builders Circle',
      builder: (BuildContext context, RouteState state) => StartersPage(),
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield PageLayout(
      children: [
        _buildHeroSection(),
        _buildCoreConceptsSection(),
        _buildOfficialDocsSection(),
        _buildDeepenUnderstandingSection(),
        _buildContributeSection(),
        _buildComingNextSection(),
      ],
    );
  }

  Component _buildHeroSection() {
    return PageHero(
      title: 'Starters',
      description: 'Welcome to the Starters Hub of the Flutter AI Builders Circle. '
          'This section offers high-quality, community-vetted resources to help you '
          'explore and build agentic apps using Flutter and AI — from basic LLM '
          'integrations to more advanced workflows using RAG, MCP, and Whisper.',
      callout: EmojiCallout(
        emoji: '🧠',
        children: [
          p([
            text(
              'We believe in learning by doing — and starting with official sources. '
              'All links below come from official documentation or deeply trusted platforms.',
            ),
          ]),
        ],
      ),
    );
  }

  Component _buildCoreConceptsSection() {
    return ContentSection(
      title: 'Core Concepts You Should Know',
      id: 'core-concepts',
      emoji: '🧩',
      children: [
        ul(
          classes: 'resource-list',
          attributes: {'role': 'list'},
          [
            ResourceLink(
              emoji: '🧠',
              title: 'LangChain: Introduction',
              description:
                  'Learn the foundations of LangChain and its modular architecture for building LLM-powered agents.',
              link: 'https://python.langchain.com/docs/introduction/',
            ),
            ResourceLink(
              emoji: '📘',
              title: 'What is Agentic AI? (IBM)',
              description:
                  'Overview of how agentic AI differs from traditional AI, with real-world examples.',
              link:
                  'https://www.ibm.com/think/topics/agentic-ai#:~:text=Agentic%20AI%20solutions%20can%20be,predictive%20analytics%20and%20execute%20trades.',
            ),
            ResourceLink(
              emoji: '🔍',
              title: 'Introducing the Model Context Protocol (Anthropic)',
              description: 'Learn how MCP standardizes interactions between LLMs and tools.',
              link: 'https://www.anthropic.com/news/model-context-protocol',
            ),
            ResourceLink(
              emoji: '📚',
              title: 'Amazon AWS: What is RAG (Retrieval-Augmented Generation)?',
              description:
                  'A simple primer on Retrieval-Augmented Generation and how it improves model accuracy.',
              link: 'https://aws.amazon.com/what-is/retrieval-augmented-generation/',
            ),
            ResourceLink(
              emoji: '🎥',
              title: 'Observable Flutter #59 – Agentic Apps with Flutter',
              description:
                  'Craig Labenz and Andrew Brogdon walk through agentic patterns, Colorist, and Firebase Genkit.',
              link:
                  'https://www.youtube.com/watch?v=eczLRG3q4V0&list=PLjxrf2q8roU1GHtc2FCHoEZr_v-LqnTZX',
            ),
          ],
        ),
      ],
    );
  }

  Component _buildOfficialDocsSection() {
    return ContentSection(
      title: 'Official Docs & Tools Worth Exploring',
      id: 'official-docs',
      emoji: '🔗',
      children: [
        ResourceCategory(
          title: 'LLM Integration (Gemini, OpenAI, Claude)',
          resources: [
            ResourceLink(
              emoji: '🎨',
              title: 'Gemini API + Flutter (Colorist Codelab)',
              description:
                  'Beginner/Intermediate. Learn how to integrate Gemini into a Flutter app using Firebase extensions and function calling.',
              link: 'https://codelabs.developers.google.com/codelabs/flutter-gemini-colorist',
            ),
            ResourceLink(
              emoji: '🤖',
              title: 'OpenAI API Docs',
              description:
                  'Beginner. Covers completions, chat, and function calling for GPT models.',
              link: 'https://platform.openai.com/docs',
            ),
            ResourceLink(
              emoji: '📦',
              title: 'dart_openai (Community SDK)',
              description:
                  'Intermediate. A Dart package that simplifies using OpenAI APIs within Flutter projects.',
              link: 'https://pub.dev/packages/dart_openai',
            ),
            ResourceLink(
              emoji: '🧠',
              title: 'Anthropic Claude API',
              description:
                  'Beginner. Official Claude API docs with example request/response flows.',
              link: 'https://docs.anthropic.com/claude/docs',
            ),
          ],
        ),
        ResourceCategory(
          title: 'Speech-to-Text (Whisper)',
          resources: [
            ResourceLink(
              emoji: '🎤',
              title: 'OpenAI Whisper API',
              description:
                  'Beginner. Transcribe audio to text using OpenAI\'s hosted Whisper model.',
              link: 'https://platform.openai.com/docs/guides/speech-to-text',
            ),
            ResourceLink(
              emoji: '📱',
              title: 'flutter_whisper.cpp',
              description:
                  'Advanced. Community-maintained Flutter app running Whisper on-device via Rust FFI and whisper.cpp.',
              link: 'https://github.com/lyledean1/flutter_whisper.cpp',
            ),
          ],
        ),
        ResourceCategory(
          title: 'Firebase Vector Search & RAG',
          resources: [
            ResourceLink(
              emoji: '🔍',
              title: 'Firestore Vector Search (Extension)',
              description:
                  'Intermediate. Store and retrieve vector embeddings in Firestore for building RAG pipelines.',
              link: 'https://extensions.dev/extensions/googlecloud/firestore-vector-search',
            ),
            ResourceLink(
              emoji: '⚡',
              title: 'Firebase Genkit',
              description:
                  'Advanced. A backend framework for building AI-driven workflows with Gemini, designed for Cloud Functions.',
              link: 'https://firebase.google.com/docs/genkit',
            ),
          ],
        ),
        ResourceCategory(
          title: 'MCP (Model Context Protocol)',
          resources: [
            ResourceLink(
              emoji: '🔄',
              title: 'Model Context Protocol Overview',
              description:
                  'Advanced. MCP is an open protocol to connect LLMs with tools and data providers.',
              link: 'https://modelcontextprotocol.io/introduction',
            ),
          ],
        ),
        ResourceCategory(
          title: 'Local LLMs (Ollama)',
          resources: [
            ResourceLink(
              emoji: '🏠',
              title: 'Ollama',
              description:
                  'Intermediate. Easily run LLMs like LLaMA or Mistral locally and serve them via HTTP.',
              link: 'https://github.com/ollama/ollama',
            ),
          ],
        ),
        ResourceCategory(
          title: 'Agentic Patterns',
          resources: [
            ResourceLink(
              emoji: '🔧',
              title: 'Function Calling (OpenAI)',
              description:
                  'Intermediate. Enables models to call structured functions from your app.',
              link: 'https://platform.openai.com/docs/guides/function-calling',
            ),
            ResourceLink(
              emoji: '🤖',
              title: 'LLM Agents (Prompt Engineering Guide)',
              description: 'Advanced. Explore ReAct and other reasoning/action agent patterns.',
              link: 'https://www.promptingguide.ai/techniques/react',
            ),
          ],
        ),
        ResourceCategory(
          title: 'Codelabs, Templates, and Examples',
          resources: [
            ResourceLink(
              emoji: '🎨',
              title: 'Colorist (Gemini + Flutter)',
              description:
                  'Intermediate. Gemini-powered Flutter app that updates the UI based on natural language prompts.',
              link: 'https://codelabs.developers.google.com/codelabs/flutter-gemini-colorist',
            ),
            ResourceLink(
              emoji: '📚',
              title: 'Gemini API Cookbook (GitHub)',
              description:
                  'Intermediate/Advanced. Google\'s official examples for calling Gemini API across languages including Dart.',
              link: 'https://github.com/google-gemini/cookbook',
            ),
          ],
        ),
        ResourceCategory(
          title: 'Dart AI Libraries',
          resources: [
            ResourceLink(
              emoji: '🔗',
              title: 'LangChain.dart',
              description:
                  'Intermediate. Community Dart port of LangChain, featuring clients for OpenAI, Google, Anthropic, and more.',
              link: 'https://pub.dev/packages/langchain',
            ),
          ],
        ),
      ],
    );
  }

  Component _buildDeepenUnderstandingSection() {
    return ContentSection(
      title: 'Want to Deepen Your Understanding?',
      id: 'deepen-understanding',
      emoji: '🧠',
      children: [
        ul(
          classes: 'resource-list',
          attributes: {'role': 'list'},
          [
            ResourceLink(
              emoji: '🎥',
              title: 'Agentic Apps with Flutter (Observable Flutter #59)',
              link:
                  'https://www.youtube.com/watch?v=eczLRG3q4V0&list=PLjxrf2q8roU1GHtc2FCHoEZr_v-LqnTZX',
              description: 'Deep dive into creating agentic Flutter applications.',
            ),
            ResourceLink(
              emoji: '💬',
              title: 'Gemini Function Calling Walkthrough (Google I/O)',
              link: 'https://ai.google.dev/gemini-api/docs/function-calling',
              description: 'Learn how to implement function calling with Gemini.',
            ),
          ],
        ),
      ],
    );
  }

  Component _buildContributeSection() {
    return ContentSection(
      title: 'Contribute or Join the Circle',
      id: 'contribute',
      emoji: '🤝',
      children: [
        ContentCard(
          children: [
            p([
              text(
                'We\'re building these kits and docs as a community. If you\'d like to:',
              )
            ]),
            ul(
              attributes: {'role': 'list'},
              [
                li([text('Submit your own starter')]),
                li([text('Add a resource to this list')]),
                li([text('Help write docs or translate examples')]),
              ],
            ),
            p([text('👉 Open a PR or stay tuned for our Slack/Discord — coming soon!')])
          ],
        ),
      ],
    );
  }

  Component _buildComingNextSection() {
    return ContentSection(
      title: 'Coming Next',
      id: 'coming-next',
      emoji: '🧪',
      children: [
        ContentCard(
          elevated: true,
          children: [
            div(
              classes: 'coming-next-content',
              [
                p(
                  classes: 'coming-next-text',
                  [
                    text('Stay tuned at '),
                    a(
                      href: 'https://ai.fluttercommunity.dev',
                      target: Target.blank,
                      attributes: {
                        'aria-label': 'Visit ai.fluttercommunity.dev',
                        'rel': 'noopener noreferrer',
                      },
                      classes: 'highlight-link',
                      [text('ai.fluttercommunity.dev')],
                    ),
                  ],
                ),
                div(
                  classes: 'volunteer-note',
                  [
                    span(
                      classes: 'emoji',
                      [text('🌱')],
                    ),
                    p([
                      text(
                        'This space is volunteer-built with ❤️ — we aim to make agentic Flutter development more accessible for everyone.',
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
}
