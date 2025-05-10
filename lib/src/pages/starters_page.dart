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
        _HeroSection(),
        _CoreConceptsSection(),
        _OfficialDocsSection(),
        _DeepenUnderstandingSection(),
        _ContributeSection(),
        _ComingNextSection(),
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
                [text('Starters')],
              ),
            ],
          ),
          p([
            text(
              'Welcome to the **Starters Hub** of the Flutter AI Builders Circle. '
              'This section offers high-quality, community-vetted resources to help you '
              'explore and build **agentic apps** using Flutter and AI — from basic LLM '
              'integrations to more advanced workflows using RAG, MCP, and Whisper.',
            )
          ]),
          blockquote([
            text(
              '🧠 We believe in learning by doing — and starting with official sources. '
              'All links below come from official documentation or deeply trusted platforms.',
            )
          ]),
        ]),
      ],
    );
  }
}

class _CoreConceptsSection extends StatelessComponent {
  const _CoreConceptsSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: 'core-concepts',
      attributes: {'role': 'region', 'aria-label': 'Core Concepts'},
      [
        div(classes: 'container', [
          h2(classes: 'section-title', [text('🧩 Core Concepts You Should Know')]),
          h3([text('What is an Agentic App?')]),
          ul(
            attributes: {'role': 'list'},
            [
              _ResourceItem(
                emoji: '🧠',
                title: 'LangChain: Introduction',
                description:
                    'Learn the foundations of LangChain and its modular architecture for building LLM-powered agents.',
                link: 'https://python.langchain.com/docs/introduction/',
              ),
              _ResourceItem(
                emoji: '📘',
                title: 'What is Agentic AI? (IBM)',
                description:
                    'Overview of how agentic AI differs from traditional AI, with real-world examples.',
                link:
                    'https://www.ibm.com/think/topics/agentic-ai#:~:text=Agentic%20AI%20solutions%20can%20be,predictive%20analytics%20and%20execute%20trades.',
              ),
              _ResourceItem(
                emoji: '🔍',
                title: 'Introducing the Model Context Protocol (Anthropic)',
                description: 'Learn how MCP standardizes interactions between LLMs and tools.',
                link: 'https://www.anthropic.com/news/model-context-protocol',
              ),
              _ResourceItem(
                emoji: '📚',
                title: 'Amazon AWS: What is RAG (Retrieval-Augmented Generation)?',
                description:
                    'A simple primer on Retrieval-Augmented Generation and how it improves model accuracy.',
                link: 'https://aws.amazon.com/what-is/retrieval-augmented-generation/',
              ),
              _ResourceItem(
                emoji: '🎥',
                title: 'Observable Flutter #59 – Agentic Apps with Flutter',
                description:
                    'Craig Labenz and Andrew Brogdon walk through agentic patterns, Colorist, and Firebase Genkit.',
                link:
                    'https://www.youtube.com/watch?v=eczLRG3q4V0&list=PLjxrf2q8roU1GHtc2FCHoEZr_v-LqnTZX',
              ),
            ],
          ),
        ]),
      ],
    );
  }
}

class _ResourceItem extends StatelessComponent {
  const _ResourceItem({
    required this.emoji,
    required this.title,
    required this.description,
    required this.link,
  });

  final String emoji;
  final String title;
  final String description;
  final String link;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield li(
      attributes: {'role': 'listitem'},
      [
        text('$emoji '),
        a(
          href: link,
          target: Target.blank,
          attributes: {
            'aria-label': '$title - $description',
            'rel': 'noopener noreferrer',
          },
          [text(title)],
        ),
        text(' – $description'),
      ],
    );
  }
}

class _OfficialDocsSection extends StatelessComponent {
  const _OfficialDocsSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: 'official-docs',
      attributes: {'role': 'region', 'aria-label': 'Official Documentation'},
      [
        div(classes: 'container', [
          h2(classes: 'section-title', [text('🔗 Official Docs & Tools Worth Exploring')]),
          _CategorySection(
            title: 'LLM Integration (Gemini, OpenAI, Claude)',
            resources: [
              _ResourceItem(
                emoji: '🎨',
                title: 'Gemini API + Flutter (Colorist Codelab)',
                description:
                    'Beginner/Intermediate. Learn how to integrate Gemini into a Flutter app using Firebase extensions and function calling.',
                link: 'https://codelabs.developers.google.com/codelabs/flutter-gemini-colorist',
              ),
              _ResourceItem(
                emoji: '🤖',
                title: 'OpenAI API Docs',
                description:
                    'Beginner. Covers completions, chat, and function calling for GPT models.',
                link: 'https://platform.openai.com/docs',
              ),
              _ResourceItem(
                emoji: '📦',
                title: 'dart_openai (Community SDK)',
                description:
                    'Intermediate. A Dart package that simplifies using OpenAI APIs within Flutter projects.',
                link: 'https://pub.dev/packages/dart_openai',
              ),
              _ResourceItem(
                emoji: '🧠',
                title: 'Anthropic Claude API',
                description:
                    'Beginner. Official Claude API docs with example request/response flows.',
                link: 'https://docs.anthropic.com/claude/docs',
              ),
            ],
          ),
          _CategorySection(
            title: 'Speech-to-Text (Whisper)',
            resources: [
              _ResourceItem(
                emoji: '🎤',
                title: 'OpenAI Whisper API',
                description:
                    'Beginner. Transcribe audio to text using OpenAI\'s hosted Whisper model.',
                link: 'https://platform.openai.com/docs/guides/speech-to-text',
              ),
              _ResourceItem(
                emoji: '📱',
                title: 'flutter_whisper.cpp',
                description:
                    'Advanced. Community-maintained Flutter app running Whisper on-device via Rust FFI and whisper.cpp.',
                link: 'https://github.com/lyledean1/flutter_whisper.cpp',
              ),
            ],
          ),
          _CategorySection(
            title: 'Firebase Vector Search & RAG',
            resources: [
              _ResourceItem(
                emoji: '🔍',
                title: 'Firestore Vector Search (Extension)',
                description:
                    'Intermediate. Store and retrieve vector embeddings in Firestore for building RAG pipelines.',
                link: 'https://extensions.dev/extensions/googlecloud/firestore-vector-search',
              ),
              _ResourceItem(
                emoji: '⚡',
                title: 'Firebase Genkit',
                description:
                    'Advanced. A backend framework for building AI-driven workflows with Gemini, designed for Cloud Functions.',
                link: 'https://firebase.google.com/docs/genkit',
              ),
            ],
          ),
          _CategorySection(
            title: 'MCP (Model Context Protocol)',
            resources: [
              _ResourceItem(
                emoji: '🔄',
                title: 'Model Context Protocol Overview',
                description:
                    'Advanced. MCP is an open protocol to connect LLMs with tools and data providers.',
                link: 'https://modelcontextprotocol.io/introduction',
              ),
            ],
          ),
          _CategorySection(
            title: 'Local LLMs (Ollama)',
            resources: [
              _ResourceItem(
                emoji: '🏠',
                title: 'Ollama',
                description:
                    'Intermediate. Easily run LLMs like LLaMA or Mistral locally and serve them via HTTP.',
                link: 'https://github.com/ollama/ollama',
              ),
            ],
          ),
          _CategorySection(
            title: 'Agentic Patterns',
            resources: [
              _ResourceItem(
                emoji: '🔧',
                title: 'Function Calling (OpenAI)',
                description:
                    'Intermediate. Enables models to call structured functions from your app.',
                link: 'https://platform.openai.com/docs/guides/function-calling',
              ),
              _ResourceItem(
                emoji: '🤖',
                title: 'LLM Agents (Prompt Engineering Guide)',
                description: 'Advanced. Explore ReAct and other reasoning/action agent patterns.',
                link: 'https://www.promptingguide.ai/techniques/react',
              ),
            ],
          ),
          _CategorySection(
            title: 'Codelabs, Templates, and Examples',
            resources: [
              _ResourceItem(
                emoji: '🎨',
                title: 'Colorist (Gemini + Flutter)',
                description:
                    'Intermediate. Gemini-powered Flutter app that updates the UI based on natural language prompts.',
                link: 'https://codelabs.developers.google.com/codelabs/flutter-gemini-colorist',
              ),
              _ResourceItem(
                emoji: '📚',
                title: 'Gemini API Cookbook (GitHub)',
                description:
                    'Intermediate/Advanced. Google\'s official examples for calling Gemini API across languages including Dart.',
                link: 'https://github.com/google-gemini/cookbook',
              ),
            ],
          ),
          _CategorySection(
            title: 'Dart AI Libraries',
            resources: [
              _ResourceItem(
                emoji: '🔗',
                title: 'LangChain.dart',
                description:
                    'Intermediate. Community Dart port of LangChain, featuring clients for OpenAI, Google, Anthropic, and more.',
                link: 'https://pub.dev/packages/langchain',
              ),
            ],
          ),
        ]),
      ],
    );
  }
}

class _CategorySection extends StatelessComponent {
  const _CategorySection({
    required this.title,
    required this.resources,
  });

  final String title;
  final List<_ResourceItem> resources;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      classes: 'category-section',
      attributes: {'role': 'region', 'aria-label': title},
      [
        h3([text(title)]),
        ul(
          attributes: {'role': 'list'},
          resources,
        ),
      ],
    );
  }
}

class _DeepenUnderstandingSection extends StatelessComponent {
  const _DeepenUnderstandingSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: 'deepen-understanding',
      attributes: {'role': 'region', 'aria-label': 'Deepen Your Understanding'},
      [
        div(classes: 'container', [
          h2(classes: 'section-title', [text('🧠 Want to Deepen Your Understanding?')]),
          ul(
            attributes: {'role': 'list'},
            [
              _ResourceItem(
                emoji: '🎥',
                title: 'Agentic Apps with Flutter (Observable Flutter #59)',
                description: '',
                link:
                    'https://www.youtube.com/watch?v=eczLRG3q4V0&list=PLjxrf2q8roU1GHtc2FCHoEZr_v-LqnTZX',
              ),
              _ResourceItem(
                emoji: '💬',
                title: 'Gemini Function Calling Walkthrough (Google I/O)',
                description: '',
                link: 'https://ai.google.dev/gemini-api/docs/function-calling',
              ),
            ],
          ),
        ]),
      ],
    );
  }
}

class _ContributeSection extends StatelessComponent {
  const _ContributeSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: 'contribute',
      attributes: {'role': 'region', 'aria-label': 'Contribute'},
      [
        div(classes: 'container', [
          h2(classes: 'section-title', [text('🤝 Contribute or Join the Circle')]),
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
          p([text('👉 **Open a PR or stay tuned for our Slack/Discord — coming soon!**')]),
        ]),
      ],
    );
  }
}

class _ComingNextSection extends StatelessComponent {
  const _ComingNextSection();

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(
      id: 'coming-next',
      attributes: {'role': 'region', 'aria-label': 'Coming Next'},
      [
        div(classes: 'container', [
          h2(classes: 'section-title', [text('🧪 Coming Next')]),
          p([
            text('Stay tuned at '),
            a(
              href: 'https://ai.fluttercommunity.dev',
              target: Target.blank,
              attributes: {
                'aria-label': 'Visit ai.fluttercommunity.dev',
                'rel': 'noopener noreferrer',
              },
              [text('ai.fluttercommunity.dev')],
            ),
          ]),
          p([
            text(
              '🌱 *This space is volunteer-built with ❤️ — we aim to make agentic Flutter development more accessible for everyone.*',
            )
          ]),
        ]),
      ],
    );
  }
}
