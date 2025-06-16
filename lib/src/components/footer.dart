import 'package:fc_ai_circle/src/app/external_links.dart';
import 'package:jaspr/browser.dart';
import 'package:jaspr_router/jaspr_router.dart';
import 'package:fc_ai_circle/src/pages/builders_page.dart';
import 'package:fc_ai_circle/src/pages/starters_page.dart';
import 'package:fc_ai_circle/src/pages/privacy_policy_page.dart';
import 'package:fc_ai_circle/src/pages/code_of_conduct_page.dart';
import 'dart:js' as js;

class Footer extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield footer([
      div(classes: 'container', [
        div(classes: 'footer-grid', [
          FooterColumn(
            title: 'Community',
            links: [
              (path: ExternalLink.youTubeAgenticQA.url, label: 'What is Agentic Flutter?'),
              (path: ExternalLink.surveyContributors.url, label: 'Take the contributors survey'),
            ],
          ),
          FooterColumn(
            title: 'Resources',
            links: [
              (path: StartersPage.path, label: 'Starters'),
              (path: BuildersPage.path, label: 'Builders'),
            ],
          ),
          div([]),
          FooterColumn(
            title: 'Legal',
            links: [
              (path: PrivacyPolicyPage.path, label: 'Privacy Policy'),
              (path: CodeOfConductPage.path, label: 'Code of Conduct'),
            ],
          ),
        ]),
        div(classes: 'footer-bottom', [
          small(
            classes: 'copyright',
            [text('© 2025 Flutter Community AI Circle. All rights reserved.')],
          ),
          div(classes: 'social-links', [
            SocialLink(
              link: ExternalLink.socialBlueSky,
              icon: 'fa-bluesky',
              label: 'BlueSky',
            ),
            SocialLink(
              link: ExternalLink.socialTwitterX,
              icon: 'fa-x-twitter',
              label: 'Twitter',
            ),
            SocialLink(
              link: ExternalLink.socialMastodon,
              icon: 'fa-mastodon',
              label: 'Mastodon',
            ),
            SocialLink(
              link: ExternalLink.socialGitHub,
              icon: 'fa-github',
              label: 'GitHub',
            ),
            SocialLink(
              link: ExternalLink.socialMedium,
              icon: 'fa-medium',
              label: 'Medium',
            ),
          ]),
        ]),
      ]),
    ]);
  }
}

class FooterColumn extends StatelessComponent {
  const FooterColumn({
    super.key,
    required this.title,
    required this.links,
  });

  final String title;
  final List<({String path, String label})> links;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      h3([text(title)]),
      ul([
        for (var link in links) //
          li([
            if (link.path == '#coming-soon')
              span(
                classes: 'footer-link coming-soon-link',
                attributes: {
                  'data-tooltip': 'Coming soon',
                  'aria-label': '${link.label} (Coming soon)'
                },
                [text(link.label)],
              )
            else if (link.path.startsWith('http'))
              a(
                href: link.path,
                target: Target.blank,
                attributes: {
                  'rel': 'noopener noreferrer',
                  'aria-label': link.label,
                },
                [text(link.label)],
              )
            else
              a(
                href: link.path,
                onClick: () {
                  // Push to the new route
                  Router.of(context).push(link.path);
                  // Force scroll to top with delay to ensure it happens after navigation
                  js.context.callMethod(
                      'eval', ['setTimeout(function() { window.scrollTo(0, 0); }, 10);']);
                },
                [text(link.label)],
              )
          ]),
      ]),
    ]);
  }
}

class SocialLink extends StatefulComponent {
  const SocialLink({
    super.key,
    required this.link,
    required this.icon,
    required this.label,
  });

  final ExternalLink link;
  final String icon;
  final String label;

  @override
  State<SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<SocialLink> {
  bool _hovering = false;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield a(
      href: component.link.url,
      target: Target.blank,
      attributes: {
        'title': component.label,
        'aria-label': component.label,
      },
      events: {
        'mouseenter': (event) {
          setState(() => _hovering = true);
        },
        'mouseleave': (event) {
          setState(() => _hovering = false);
        },
      },
      classes: 'button-reset',
      [
        i(
          classes: [
            'fa-brands',
            component.icon,
            // see: https://docs.fontawesome.com/web/style/animate
            if (_hovering) 'fa-beat',
          ].join(' '),
          [],
        ),
      ],
    );
  }
}
