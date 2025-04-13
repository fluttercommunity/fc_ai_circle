## AI Builders Circle Site

The site is built with Dart utilizing the [Dart Web Platform](https://dart.dev/web) with web libraries like [`package:web`](https://pub.dev/packages/web) to interop with JS and the DOM.

We utilize [Jaspr](https://pub.dev/packages/jaspr) to provide a more Flutter centric feel to web development. Check out the [docs](https://docs.jaspr.site/) for more info.

## Running and building

To run the app, activate and use [`package:webdev`](https://dart.dev/tools/webdev):

```
dart pub global activate webdev
webdev serve
```

To build a production version ready for deployment,
use the `webdev build` command:

```
webdev build
```

To learn how to interop with web APIs and other JS libraries, check out https://dart.dev/interop/js-interop.
