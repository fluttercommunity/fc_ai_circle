import 'dart:js_interop';
import 'dart:math' as math;

import 'package:jaspr/ui.dart';
import 'package:vector_math/vector_math.dart' hide Colors;
import 'package:web/web.dart';

class ThreeDCarousel extends StatefulComponent {
  const ThreeDCarousel({super.key});

  @override
  State<ThreeDCarousel> createState() => _ThreeDCarouselState();
}

class _ThreeDCarouselState extends State<ThreeDCarousel> {
  late double _last, _elapsed = 0.0;
  bool _paused = false;

  @override
  void initState() {
    super.initState();
    _last = window.performance.timeOrigin;
    window.requestAnimationFrame(onTick.toJS);
  }

  void _onEnter(Event event) {
    _paused = true;
  }

  void _onLeave(Event event) {
    _paused = false;
    _last = window.performance.now() / 1000.0;
    window.requestAnimationFrame(onTick.toJS);
  }

  void onTick(double timestamp) {
    if (mounted && !_paused) {
      final now = window.performance.now() / 1000.0;
      _elapsed += (_last - now);
      _last = now;
      final carouselItems = document.getElementById('carousel')!.children;
      for (int index = 0; index < carouselItems.length; index++) {
        final item = carouselItems.item(index)! as HTMLElement;
        final pos = _childPosition(index, carouselItems.length);
        item.style.left = '${pos.x}px';
        item.style.top = '${pos.y}px';
        item.style.scale = pos.z.toString();
      }
      window.requestAnimationFrame(onTick.toJS);
    }
  }

  ({double x, double y, double z}) _childPosition(int index, int count) {
    final size = (width: 640, height: 400);
    final center = (x: 360, y: 200);
    double angle = ((360.0 * (_elapsed / 40)) + (index * (360.0 / count))) % 360;
    final x = math.sin(radians(angle)) * size.width * 0.5;
    final y = math.cos(radians(angle)) * size.height * 0.25;
    final z = 0.4 + ((((angle / 90.0) * 0.25).clamp(-1.0, 1.0) - 0.5).abs() * 1.6);
    return (x: center.x + x, y: center.y + y, z: z);
  }

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield div(
      id: 'carousel',
      styles: Styles(position: Position.relative()),
      events: {
        'mouseenter': _onEnter,
        'mouseleave': _onLeave,
      },
      [
        _FloatingIconLink(
          link: '#',
          child: Column(
            crossAxisAlignment: AlignItems.center,
            children: [
              span(styles: Styles(fontSize: Unit.points(48.0)), [text('🚀')]),
              text('Starters'),
            ],
          ),
        ),
        _FloatingIconLink(
          link: '#',
          child: Column(
            crossAxisAlignment: AlignItems.center,
            children: [
              span(styles: Styles(fontSize: Unit.points(48.0)), [text('👷‍♂️')]),
              text('Builders'),
            ],
          ),
        ),
        _FloatingIconLink(
          link: '#',
          child: Column(
            crossAxisAlignment: AlignItems.center,
            children: [
              span(styles: Styles(fontSize: Unit.points(48.0)), [text('📺')]),
              text('YouTube'),
            ],
          ),
        ),
        _FloatingIconLink(
          link: '#',
          child: Column(
            crossAxisAlignment: AlignItems.center,
            children: [
              span(styles: Styles(fontSize: Unit.points(48.0)), [text('👩‍💻')]),
              text('GitHub'),
            ],
          ),
        ),
        _FloatingIconLink(
          link: '#',
          child: Column(
            crossAxisAlignment: AlignItems.center,
            children: [
              span(styles: Styles(fontSize: Unit.points(48.0)), [text('💬')]),
              text('Forum'),
            ],
          ),
        ),
      ],
    );
  }
}

class _FloatingIconLink extends StatelessComponent {
  const _FloatingIconLink({
    required this.link,
    required this.child,
  });

  final String link;
  final Component child;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield a(
      styles: Styles(
        raw: {'position': 'absolute'},
        transform: Transform.translate(
          x: Unit.percent(-50.0),
          y: Unit.percent(-50.0),
        ),
        textDecoration: TextDecoration.none,
        color: Colors.white,
      ),
      href: link,
      [child],
    );
  }
}
