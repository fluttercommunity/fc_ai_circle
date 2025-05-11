import 'package:fc_ai_circle/src/components/content_section.dart';
import 'package:fc_ai_circle/src/components/page_hero.dart';
import 'package:fc_ai_circle/src/components/resource_link.dart';
import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:fc_ai_circle/src/app/external_links.dart';
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
              variant: CardVariant.highlighted,
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
              variant: CardVariant.blueGlow,
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
              variant: CardVariant.orangeGlow,
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
          accent: CategoryAccent.purple,
          resources: [
            ResourceLink(
              emoji: '🎨',
              title: 'Gemini API + Flutter (Colorist Codelab)',
              description:
                  'Beginner/Intermediate. Learn how to integrate Gemini into a Flutter app using Firebase extensions and function calling.',
              link: 'https://codelabs.developers.google.com/codelabs/flutter-gemini-colorist',
              variant: CardVariant.highlighted,
            ),
            ResourceLink(
              emoji: '🤖',
              title: 'OpenAI API Docs',
              description:
                  'Beginner. Covers completions, chat, and function calling for GPT models.',
              link: 'https://platform.openai.com/docs',
            ),
            ResourceLink(
              emoji: '🧠',
              title: 'Anthropic Claude API',
              description:
                  'Beginner. Official Claude API docs with example request/response flows.',
              link: 'https://docs.anthropic.com/claude/docs',
            ),
            ResourceLink(
              emoji: '📦',
              title: 'mcp_dart (Community SDK)',
              description:
                  'Integrate LLM applications with external data and tools using this Dart SDK for the Model Context Protocol (MCP).',
              link: 'https://pub.dev/packages/mcp_dart',
            ),
            ResourceLink(
              emoji: '📦',
              title: 'dart_openai (Community SDK)',
              description:
                  'Intermediate. A Dart package that simplifies using OpenAI APIs within Flutter projects.',
              link: 'https://pub.dev/packages/dart_openai',
            ),
          ],
        ),
        ResourceCategory(
          title: 'Speech-to-Text (Whisper)',
          accent: CategoryAccent.green,
          resources: [
            ResourceLink(
              emoji: '🎤',
              title: 'OpenAI Whisper API',
              description:
                  'Beginner. Transcribe audio to text using OpenAI\'s hosted Whisper model.',
              link: 'https://platform.openai.com/docs/guides/speech-to-text',
              variant: CardVariant.greenGlow,
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
          accent: CategoryAccent.orange,
          useGrid: true,
          resources: [
            ResourceLink(
              emoji: '🔍',
              title: 'Firestore Vector Search (Extension)',
              description:
                  'Intermediate. Store and retrieve vector embeddings in Firestore for building RAG pipelines.',
              link: 'https://extensions.dev/extensions/googlecloud/firestore-vector-search',
              variant: CardVariant.orangeGlow,
            ),
            ResourceLink(
              emoji: '⚡',
              title: 'Firebase Genkit',
              description:
                  'Advanced. A backend framework for building AI-driven workflows with Gemini, designed for Cloud Functions.',
              link: 'https://firebase.google.com/docs/genkit',
              variant: CardVariant.highlighted,
            ),
          ],
        ),
        ResourceCategory(
          title: 'MCP (Model Context Protocol)',
          accent: CategoryAccent.blue,
          resources: [
            ResourceLink(
              emoji: '🔄',
              title: 'Model Context Protocol Overview',
              description:
                  'Advanced. MCP is an open protocol to connect LLMs with tools and data providers.',
              link: 'https://modelcontextprotocol.io/introduction',
              variant: CardVariant.blueGlow,
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
          accent: CategoryAccent.purple,
          useGrid: true,
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
              variant: CardVariant.highlighted,
            ),
          ],
        ),
        ResourceCategory(
          title: 'Codelabs, Templates, and Examples',
          accent: CategoryAccent.green,
          useHorizontalScroll: true,
          resources: [
            ResourceLink(
              emoji: '🎨',
              title: 'Colorist (Gemini + Flutter)',
              description:
                  'Intermediate. Gemini-powered Flutter app that updates the UI based on natural language prompts.',
              link: 'https://codelabs.developers.google.com/codelabs/flutter-gemini-colorist',
              variant: CardVariant.highlighted,
            ),
            ResourceLink(
              emoji: '📚',
              title: 'Gemini API Cookbook (GitHub)',
              description:
                  'Intermediate/Advanced. Google\'s official examples for calling Gemini API across languages including Dart.',
              link: 'https://github.com/google-gemini/cookbook',
              variant: CardVariant.greenGlow,
            ),
            ResourceLink(
              emoji: '🚀',
              title: 'Gemini Flutter Weather App',
              description:
                  'Beginner/Intermediate. Weather app powered by Gemini AI with natural language interaction.',
              link: 'https://github.com/flutter/samples/tree/main/ai_weather',
            ),
            ResourceLink(
              emoji: '📝',
              title: 'OpenAI Translator Example',
              description:
                  'Intermediate. Demonstrates using OpenAI to build a multilingual translator app.',
              link:
                  'https://github.com/openai/openai-cookbook/blob/main/examples/How_to_build_a_multilingual_translator.md',
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
              variant: CardVariant.highlighted,
            ),
            ResourceLink(
              emoji: '🤖',
              title: 'Flutter GenAI',
              description:
                  'Advanced. A collection of Flutter plugins for integrating generative AI capabilities into your applications.',
              link: 'https://pub.dev/packages/flutter_genai',
              variant: CardVariant.blueGlow,
            ),
            ResourceLink(
              emoji: '📱',
              title: 'Dart OpenAI',
              description:
                  'Beginner/Intermediate. A Dart client for OpenAI API with chat, completions, embeddings and more.',
              link: 'https://pub.dev/packages/dart_openai',
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
              description:
                  'Craig Labenz and Andrew Brogdon discuss and explore AI-powered, agentic apps in Flutter in this Observable Flutter episode.',
              variant: CardVariant.greenGlow,
            ),
            ResourceLink(
              emoji: '💬',
              title: 'Gemini API: Function Calling Docs',
              link: ExternalLink.geminiFunctionCallingDocs.url,
              description:
                  'Official Gemini API docs on connecting models to external tools and APIs. Learn how function calling bridges natural language to real-world actions and data.',
              variant: CardVariant.blueGlow,
            ),
            ResourceLink(
              emoji: '🎥',
              title: 'Jhin Lee on mcp_dart (Humpday Q&A)',
              description:
                  'GDE Jhin Lee discusses the mcp_dart package and the Model Context Protocol. (MCP segment starts at 29:54).',
              link: ExternalLink.youTubeJhinLeeMCPHumpdayQA.url,
              variant: CardVariant.orangeGlow,
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
      elevated: true,
      children: [
        ContentCard(
          elevated: true,
          animateCta: true,
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
            p([
              span(
                classes: 'cta_button',
                [
                  a(
                    href: ExternalLink.surveyContributors.url,
                    target: Target.blank,
                    attributes: {
                      'aria-label': 'Contribute: Take the Contributors Survey',
                      'rel': 'noopener noreferrer',
                    },
                    [text('Become a Contributor')],
                  )
                ],
              )
            ])
          ],
        ),
      ],
    );
  }

  Component _buildComingNextSection() {
    return ContentSection(
      title: 'Stay Connected & See What\'s Next',
      id: 'coming-next',
      emoji: '📺',
      elevated: true,
      children: [
        ContentCard(
          elevated: true,
          children: [
            h3([text('Catch Our Streams & Join the Conversation!')]),
            p([
              text(
                  'Tune into live Humpday Q&As, Vibe Coding sessions, and exclusive AI Circle content on the official Flutter Community channel. Then, chat with us on the forum!')
            ]),
            div(classes: 'buttons-container', [
              a(
                  classes: 'cta_button',
                  href: ExternalLink.youTubeFlutterCommunity.url,
                  target: Target.blank,
                  attributes: {
                    'aria-label': 'Watch Flutter Community on YouTube',
                    'rel': 'noopener noreferrer'
                  },
                  [
                    text('▶️ Watch on YouTube')
                  ]),
              a(
                  classes: 'secondary-button',
                  href: ExternalLink.forumChat.url,
                  target: Target.blank,
                  attributes: {
                    'aria-label': 'Join the Flutter Community Forum',
                    'rel': 'noopener noreferrer'
                  },
                  [
                    text('💬 Join the Forum')
                  ]),
            ]),
          ],
        ),
        // Simple, centered volunteer note (no longer in a card)
        p(
          styles: Styles.raw({
            'text-align': 'center',
            'color': 'var(--secondary-text)',
            'margin-top': 'var(--spacing-lg)',
            'font-size': '0.9em' /* Optional: slightly smaller text for a footnote feel */
          }),
          [
            span(classes: 'emoji', [text('🌱')]),
            text(' This space is volunteer-built with '),
            span(classes: 'emoji', [text('❤️')]),
            text(' — we aim to make agentic Flutter development more accessible for everyone.'),
          ],
        ),
      ],
    );
  }
}
