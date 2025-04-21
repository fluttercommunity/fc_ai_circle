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
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          children: [
            DomComponent(
              tag: 'h1',
              child: Text('Build Agentic Flutter Experiences'),
            ),
            DomComponent(
              tag: 'p',
              child: Text(
                  'A community-powered space for developers building with AI, agentic apps, and next-gen Flutter workflows.'),
            ),
            DomComponent(
              tag: 'div',
              classes: 'buttons-container',
              children: [
                DomComponent(
                  tag: 'a',
                  classes: 'cta_button',
                  attributes: {'href': '#'},
                  child: Text('Explore Builders'),
                ),
                DomComponent(
                  tag: 'a',
                  classes: 'secondary-button',
                  attributes: {'href': '#'},
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
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          children: [
            DomComponent(
              tag: 'h2',
              child: Text('Why Choose Our Product'),
            ),
            DomComponent(
              tag: 'div',
              classes: 'features-grid',
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
      classes: 'feature-card',
      children: [
        DomComponent(
          tag: 'h3',
          child: Text(title),
        ),
        DomComponent(
          tag: 'p',
          child: Text(description),
        ),
      ],
    );
  }

  Component _ctaSection() {
    return DomComponent(
      tag: 'section',
      classes: 'cta-section',
      children: [
        DomComponent(
          tag: 'div',
          classes: 'container',
          children: [
            DomComponent(
              tag: 'h2',
              child: Text('Ready to Take the Next Step?'),
            ),
            DomComponent(
              tag: 'p',
              child: Text(
                'Join thousands of satisfied users who have transformed '
                'their digital presence with us.',
              ),
            ),
            DomComponent(
              tag: 'a',
              classes: 'cta_button',
              attributes: {'href': '#'},
              child: Text('Get Started Now'),
            ),
          ],
        ),
      ],
    );
  }
}
