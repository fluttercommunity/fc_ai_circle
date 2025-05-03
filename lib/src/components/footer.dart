import 'package:jaspr/browser.dart';

class Footer extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield footer([
      div(classes: 'container', [
        div(classes: 'footer-grid', [
          FooterColumn(
            title: 'Community',
            links: ['About', 'Mission', 'Join the Circle', 'Start Contributing'],
          ),
          FooterColumn(
            title: 'Resources',
            links: ['Docs', 'Templates', 'Survey', 'Events'],
          ),
          FooterColumn(
            title: 'Channels',
            links: ['YouTube', 'Twitter', 'Forum', 'GitHub'],
          ),
          FooterColumn(
            title: 'Legal',
            links: ['Privacy', 'Terms', 'Code of Conduct', 'Licensing'],
          ),
        ]),
        div(classes: 'footer-bottom', [
          small(
            classes: 'copyright',
            [text('© 2025 Flutter Community AI Circle. All rights reserved.')],
          ),
          div(classes: 'social-links', [
            SocialLink(
              icon: 'fa-bluesky',
              label: 'BlueSky',
              href: 'https://bsky.app/profile/fluttercommunity.dev',
            ),
            SocialLink(
              icon: 'fa-x-twitter',
              label: 'Twitter',
              href: 'https://x.com/fluttercomm',
            ),
            SocialLink(
              icon: 'fa-mastodon',
              label: 'Mastodon',
              href: 'https://fluttercommunity.social/@FlutterComm',
            ),
            SocialLink(
              icon: 'fa-github',
              label: 'GitHub',
              href: 'https://github.com/fluttercommunity/fc_ai_circle',
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
  final List<String> links;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div([
      h3([text(title)]),
      ul([
        for (var link in links) //
          li([
            a(href: '#', [text(link)])
          ]),
      ]),
    ]);
  }
}

class SocialLink extends StatefulComponent {
  const SocialLink({
    super.key,
    required this.href,
    required this.icon,
    required this.label,
  });

  final String href;
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
      href: component.href,
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
