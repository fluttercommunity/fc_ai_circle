import 'package:fc_ai_circle/src/components/content_section.dart';
import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';

/// Privacy Policy page for the Flutter Community AI Circle website.
class PrivacyPolicyPage extends StatelessComponent {
  const PrivacyPolicyPage({super.key});

  static const path = '/privacy-policy';

  /// Defines the routing for this page
  static Iterable<Route> route() sync* {
    yield Route(
      path: path,
      title: 'Privacy Policy - Flutter AI Builders Circle',
      builder: (BuildContext context, RouteState state) => const PrivacyPolicyPage(),
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield PageLayout(
      children: [
        ContentSection(
          title: 'Privacy Policy',
          id: 'privacy-policy',
          emoji: '🔒',
          children: [
            ContentCard(
              elevated: true,
              children: [
                h2([text('Privacy Policy for Flutter Community AI Circle')]),
                p([
                  text('Last Updated: June 15, 2024'),
                ]),
                p([
                  text(
                      'The Flutter Community AI Circle values your privacy and is committed to protecting your personal data. This Privacy Policy explains how we collect, use, and safeguard your information when you visit our website or participate in our community.'),
                ]),
                h3([text('Information We Collect')]),
                p([
                  text('We may collect and process the following types of personal data:'),
                ]),
                ul([
                  li([
                    text(
                        'Information you provide when completing surveys or forms (name, email, etc.)'),
                  ]),
                  li([
                    text(
                        'Usage data including how you interact with our website and community resources'),
                  ]),
                  li([
                    text(
                        'Information from third-party services when you engage with our community through those platforms (GitHub, Discord, etc.)'),
                  ]),
                ]),
                h3([text('How We Use Your Information')]),
                p([
                  text('We use the information we collect to:'),
                ]),
                ul([
                  li([text('Improve our resources and community offerings')]),
                  li([text('Communicate with you about events, updates, and opportunities')]),
                  li([text('Customize content and experiences based on your interests')]),
                  li([text('Analyze and understand how our resources are being used')]),
                ]),
                h3([text('Data Security')]),
                p([
                  text(
                      'We implement appropriate technical and organizational measures to protect your personal data. However, no method of transmission over the Internet is 100% secure.'),
                ]),
                h3([text('Third-Party Services')]),
                p([
                  text(
                      'Our website and community resources may contain links to third-party websites and services. We are not responsible for the privacy practices of these external sites.'),
                ]),
                h3([text('Your Rights')]),
                p([
                  text(
                      'Depending on your location, you may have rights regarding your personal data, including:'),
                ]),
                ul([
                  li([text('Access to your personal data')]),
                  li([text('Correction of inaccurate data')]),
                  li([text('Deletion of your data')]),
                  li([text('Restriction of processing')]),
                  li([text('Data portability')]),
                ]),
                h3([text('Updates to This Policy')]),
                p([
                  text(
                      'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new policy on this page.'),
                ]),
                h3([text('Contact Us')]),
                p([
                  text('If you have questions about this Privacy Policy, please contact us at '),
                  a(
                    href: 'mailto:flutter.community@example.com',
                    target: Target.blank,
                    attributes: {'rel': 'noopener noreferrer'},
                    [text('flutter.community@example.com')],
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
