import 'package:jaspr/ui.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:fc_ai_circle/src/layouts/page_layout.dart';
import 'package:fc_ai_circle/src/components/content_section.dart';

class PrivacyPolicyPage extends StatelessComponent {
  const PrivacyPolicyPage({super.key});

  static const path = '/privacy-policy';

  static Iterable<Route> route() sync* {
    yield Route(
      path: path,
      title: 'Privacy Policy - Flutter Community AI Circle',
      builder: (BuildContext context, RouteState state) => PrivacyPolicyPage(),
    );
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield PageLayout(
      children: [
        ContentSection(
          title: 'Privacy Policy',
          children: [
            p([text('Effective Date: 29-Aug-2023')]),
            h2([text('Who we are')]),
            div(
              styles: Styles(
                padding: Spacing.all(Unit.em(1)),
                color: Colors.white,
                backgroundColor: Color.value(0x555555),
              ),
              [text('Our website address is: https://fluttercommunityaicircle.org')],
            ),
            Spacer(height: Unit.em(1)),
            h2([text('App Data')]),
            p([
              text(
                'Our published apps do NOT currently collect any data. '
                'If in the future we create apps which collect data, '
                'we will update this Privacy Policy.',
              )
            ]),
            p([
              text(
                'Our published apps do NOT transmit to or store '
                'any data to our website or server(s).',
              )
            ]),
            p([
              text(
                'Any apps in testing may collect usage and/or crash '
                'data, if you choose to share this data it will be '
                'transmitted to us.',
              )
            ]),
            Spacer(height: Unit.em(1)),
            h2([text('Website Data')]),
            p([
              text(
                'Data transmitted via our Contact Us page links '
                'are managed by the respective sites.',
              ),
              div(
                styles: Styles(
                  flexDirection: FlexDirection.column,
                  lineHeight: Unit.em(2.5),
                  margin: Spacing.only(left: Unit.em(2.0)),
                ),
                [
                  a(
                    href: 'https://twitter.com/en/privacy',
                    target: Target.blank,
                    [text('Twitter/X')],
                  ),
                ],
              ),
            ]),
            p([
              text('We use '),
              a(
                href: 'https://analytics.google.com/',
                target: Target.blank,
                [text('basic Google Analytics')],
              ),
              text(' on our website to understand how our site is used. You can see '),
              a(
                href: 'https://policies.google.com/privacy',
                target: Target.blank,
                [text('Google\'s privacy policy')],
              ),
              text(
                ' for more details. The lowest level of detail we see is, '
                'if the data is available:',
              ),
            ]),
            ul([
              li([text('Acquisition: How you reached our site (ex. direct or search)')]),
              li([text('Demographics: Language, Country, and City (NOT your specific location)')]),
              li([text('Mobile: Device brand, model, marketing name, and screen resolution')]),
              li([text('Technology: Browser & operating system and Internet service provider')]),
            ]),
            Spacer(height: Unit.em(3.0)),
          ],
        ),
      ],
    );
  }
}
