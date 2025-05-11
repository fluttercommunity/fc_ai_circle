import 'package:fc_ai_circle/src/components/content_section.dart';
import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';

/// Code of Conduct page for the Flutter Community AI Circle website.
class CodeOfConductPage extends StatelessComponent {
  const CodeOfConductPage({super.key});

  static const path = '/code-of-conduct';

  /// Defines the routing for this page
  static Iterable<Route> route() sync* {
    yield Route(
      path: path,
      title: 'Code of Conduct - Flutter AI Builders Circle',
      builder: (BuildContext context, RouteState state) => const CodeOfConductPage(),
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield PageLayout(
      children: [
        ContentSection(
          title: 'Code of Conduct',
          id: 'code-of-conduct',
          emoji: '🤝',
          children: [
            ContentCard(
              elevated: true,
              children: [
                h2([text('Flutter Community AI Circle Code of Conduct')]),
                p([
                  text('Last Updated: June 15, 2024'),
                ]),
                p([
                  text(
                      'The Flutter Community AI Circle is dedicated to providing a safe, inclusive, and welcoming environment for all community members, regardless of background, identity, or experience level.'),
                ]),
                h3([text('Our Pledge')]),
                p([
                  text(
                      'In the interest of fostering an open and welcoming community, we pledge to make participation in our community a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.'),
                ]),
                h3([text('Expected Behavior')]),
                p([
                  text('As a member of this community, you are expected to:'),
                ]),
                ul([
                  li([text('Be kind, respectful, and considerate to others')]),
                  li([text('Use welcoming and inclusive language')]),
                  li([text('Respect differing viewpoints and experiences')]),
                  li([text('Accept constructive criticism gracefully')]),
                  li([text('Focus on what is best for the community')]),
                  li([text('Show empathy towards other community members')]),
                ]),
                h3([text('Unacceptable Behavior')]),
                p([
                  text('The following behaviors are considered unacceptable:'),
                ]),
                ul([
                  li([
                    text('Harassment, intimidation, or discrimination in any form'),
                  ]),
                  li([
                    text(
                        'Offensive or derogatory comments related to personal characteristics or choices'),
                  ]),
                  li([
                    text('Inappropriate or unwelcome attention or contact'),
                  ]),
                  li([
                    text('Public or private harassment'),
                  ]),
                  li([
                    text('Publishing others\' private information without explicit permission'),
                  ]),
                  li([
                    text('Other conduct which could reasonably be considered inappropriate'),
                  ]),
                ]),
                h3([text('Enforcement')]),
                p([
                  text(
                      'Violations of this Code of Conduct may result in temporary or permanent exclusion from community spaces or activities. The severity and details of enforcement will depend on the specific circumstances.'),
                ]),
                h3([text('Reporting')]),
                p([
                  text(
                      'If you experience or witness behavior that violates this Code of Conduct, please report it by contacting the community organizers at '),
                  a(
                    href: 'mailto:flutter.community@example.com',
                    target: Target.blank,
                    attributes: {'rel': 'noopener noreferrer'},
                    [text('flutter.community@example.com')],
                  ),
                  text('.'),
                ]),
                p([
                  text(
                      'All reports will be reviewed and investigated promptly and fairly. All community organizers are obligated to maintain confidentiality with regard to the reporter of an incident.'),
                ]),
                h3([text('Attribution')]),
                p([
                  text('This Code of Conduct is adapted from the '),
                  a(
                    href: 'https://www.contributor-covenant.org',
                    target: Target.blank,
                    attributes: {'rel': 'noopener noreferrer'},
                    [text('Contributor Covenant')],
                  ),
                  text(', version 2.0, available at '),
                  a(
                    href: 'https://www.contributor-covenant.org/version/2/0/code_of_conduct.html',
                    target: Target.blank,
                    attributes: {'rel': 'noopener noreferrer'},
                    [text('contributor-covenant.org/version/2/0/code_of_conduct.html')],
                  ),
                  text('.'),
                ]),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
