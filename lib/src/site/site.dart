import 'package:jaspr/jaspr.dart';
import 'package:jaspr/ui.dart';
import 'package:jaspr_router/jaspr_router.dart';

class Site extends StatefulComponent {
  const Site({super.key});

  @override
  State<Site> createState() => _SiteState();
}

class _SiteState extends State<Site> {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Router(
      routes: [
        Route(
          path: '/',
          title: 'Welcome',
          builder: (BuildContext context, RouteState state) {
            return WelcomePage();
          },
        ),
      ],
    );
  }
}

class WelcomePage extends StatelessComponent {
  const WelcomePage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final now = DateTime.now();
    yield Text(
      'The time is ${now.hour}:${now.minute} '
      'and your Dart web app is running!',
    );
  }
}
