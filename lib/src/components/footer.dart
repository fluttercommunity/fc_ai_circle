import 'package:jaspr/browser.dart';

class Footer extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'footer',
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          children: [
            DomComponent(
              tag: 'div',
              classes: 'footer-grid',
              children: [
                _footerColumn('Company', ['About', 'Careers', 'Blog', 'Press']),
                _footerColumn('Product', ['Features', 'Pricing', 'Integrations', 'FAQ']),
                _footerColumn('Resources', ['Documentation', 'Guides', 'Support', 'API']),
                _footerColumn('Legal', ['Privacy', 'Terms', 'Security', 'Cookies']),
              ],
            ),
            DomComponent(
              tag: 'div',
              classes: 'footer-bottom',
              children: [
                DomComponent(
                  tag: 'small',
                  classes: 'copyright',
                  child: Text('© 2025 Flutter Community. All rights reserved.'),
                ),
                DomComponent(
                  tag: 'div',
                  classes: 'social-links',
                  children: [
                    SocialLink(label: 'Twitter', href: '#'),
                    SocialLink(label: 'LinkedIn', href: '#'),
                    SocialLink(label: 'Instagram', href: '#'),
                    SocialLink(label: 'GitHub', href: '#'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _footerColumn(String title, List<String> links) {
    return DomComponent(
      tag: 'div',
      children: [
        DomComponent(
          tag: 'h3',
          child: Text(title),
        ),
        DomComponent(
          tag: 'ul',
          children: [
            for (var link in links) //
              DomComponent(
                tag: 'li',
                child: DomComponent(
                  tag: 'a',
                  attributes: {'href': '#'},
                  child: Text(link),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class SocialLink extends StatelessComponent {
  const SocialLink({
    super.key,
    required this.href,
    required this.label,
  });

  final String href;
  final String label;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'a',
      attributes: {'href': href},
      child: Text(label),
    );
  }
}
