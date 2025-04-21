import 'package:jaspr/browser.dart';
import 'package:web/web.dart' hide Text;

class HomePage extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield DomComponent(
      tag: 'div',
      classes: 'home-page',
      children: [
        _heroSection(),
        _featuresSection(),
        _ctaSection(),
      ],
    );
  }

  Component _heroSection() {
    return DomComponent(
      tag: 'section',
      classes: 'hero',
      styles: Styles(raw: {
        'padding-top': '120px',
        'min-height': '90vh',
        'display': 'flex',
        'flex-direction': 'column',
        'justify-content': 'center',
        'background': 'radial-gradient(circle at 50% 50%, #1f1f2e, #0a0a0f)',
        'position': 'relative',
        'overflow': 'hidden',
      }),
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          styles: Styles(raw: {
            'text-align': 'center',
            'max-width': '800px',
            'margin': '0 auto',
          }),
          children: [
            DomComponent(
              tag: 'h1',
              styles: Styles(raw: {
                'font-size': '64px',
                'margin-bottom': '20px',
                'background': 'var(--accent-gradient)',
                '-webkit-background-clip': 'text',
                'background-clip': 'text',
                'color': 'transparent',
              }),
              child: Text('Build Agentic Flutter Experiences'),
            ),
            DomComponent(
              tag: 'p',
              styles: Styles(raw: {
                'font-size': '20px',
                'margin-bottom': '40px',
                'color': 'var(--secondary-text)',
              }),
              child: Text(
                  'A community-powered space for developers building with AI, agentic apps, and next-gen Flutter workflows.'),
            ),
            DomComponent(
              tag: 'div',
              styles: Styles(raw: {
                'display': 'flex',
                'gap': '20px',
                'justify-content': 'center',
              }),
              children: [
                DomComponent(
                  tag: 'a',
                  classes: 'cta_button',
                  attributes: {'href': '#'},
                  styles: Styles(raw: {
                    'font-size': '18px',
                  }),
                  child: Text('Explore Builders'),
                ),
                DomComponent(
                  tag: 'a',
                  attributes: {'href': '#'},
                  styles: Styles(raw: {
                    'display': 'inline-flex',
                    'align-items': 'center',
                    'gap': '8px',
                    'padding': '12px 24px',
                    'border': '1px solid var(--secondary-text)',
                    'border-radius': '4px',
                    'color': 'var(--text-color)',
                    'font-weight': '600',
                    'font-size': '18px',
                  }),
                  child: Text('What is Agentic Flutter?'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _featuresSection() {
    return DomComponent(
      tag: 'section',
      id: 'features',
      styles: Styles(raw: {
        'padding': '100px 0',
        'background-color': 'var(--primary-color)',
      }),
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          children: [
            DomComponent(
              tag: 'h2',
              styles: Styles(raw: {
                'text-align': 'center',
                'font-size': '42px',
                'margin-bottom': '60px',
              }),
              child: Text('Why Choose Our Product'),
            ),
            DomComponent(
              tag: 'div',
              styles: Styles(raw: {
                'display': 'grid',
                'grid-template-columns': 'repeat(auto-fit, minmax(300px, 1fr))',
                'gap': '40px',
              }),
              children: [
                _featureCard('Lightning Fast',
                    'Experience performance like never before with our optimized platform.'),
                _featureCard('Highly Secure',
                    'Your data is protected with enterprise-grade security measures.'),
                _featureCard('Always Available',
                    '99.9% uptime guarantee so you\'re always online when it counts.'),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Component _featureCard(String title, String description) {
    return DomComponent(
      tag: 'div',
      styles: Styles(raw: {
        'background-color': 'rgba(255, 255, 255, 0.05)',
        'border-radius': '8px',
        'padding': '30px',
        'transition': 'transform 0.3s',
      }),
      events: {
        'mouseover': (event) => (event.currentTarget as HTMLDivElement) //
            .style
            .setProperty('transform', 'translateY(-10px)'),
        'mouseout': (event) => (event.currentTarget as HTMLDivElement) //
            .style
            .setProperty('transform', 'translateY(0)'),
      },
      children: [
        DomComponent(
          tag: 'h3',
          styles: Styles(raw: {
            'font-size': '24px',
            'margin-bottom': '15px',
            'color': 'var(--accent-color)',
          }),
          child: Text(title),
        ),
        DomComponent(
          tag: 'p',
          styles: Styles(raw: {
            'color': 'var(--secondary-text)',
            'line-height': '1.6',
          }),
          child: Text(description),
        ),
      ],
    );
  }

  Component _ctaSection() {
    return DomComponent(
      tag: 'section',
      styles: Styles(raw: {
        'padding': '80px 0',
        'background': 'linear-gradient(135deg, #1f1f2e, #32164f)',
      }),
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          styles: Styles(raw: {
            'text-align': 'center',
          }),
          children: [
            DomComponent(
              tag: 'h2',
              styles: Styles(raw: {
                'font-size': '38px',
                'margin-bottom': '20px',
              }),
              child: Text('Ready to Take the Next Step?'),
            ),
            DomComponent(
              tag: 'p',
              styles: Styles(raw: {
                'font-size': '18px',
                'max-width': '600px',
                'margin': '0 auto 40px',
                'color': 'var(--secondary-text)',
              }),
              child: Text(
                'Join thousands of satisfied users who have transformed '
                'their digital presence with us.',
              ),
            ),
            DomComponent(
              tag: 'a',
              classes: 'cta_button',
              attributes: {'href': '#'},
              styles: Styles(raw: {
                'font-size': '18px',
                'padding': '15px 30px',
              }),
              child: Text('Get Started Now'),
            ),
          ],
        ),
      ],
    );
  }
}
