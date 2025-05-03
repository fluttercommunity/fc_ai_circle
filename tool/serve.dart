import 'dart:io';

void main() async {
  final client = HttpClient();

  Future<HttpClientResponse> makeRequest(
    String method,
    Uri uri,
    HttpHeaders headers,
    List<int>? body,
  ) async {
    final request = await client.openUrl(method, uri);
    headers.forEach(request.headers.add);
    if (body != null && body.isNotEmpty) {
      request.write(body);
    }
    return request.close();
  }

  final server = await HttpServer.bind(InternetAddress.anyIPv4, 5050);

  // proxy requests so that content not found is attempted again as the root page
  server.listen((HttpRequest request) async {
    final body = await request.expand((el) => el).toList();
    var innerReq = await makeRequest(
      request.method,
      request.requestedUri.replace(port: 5051),
      request.headers,
      body,
    );
    if (innerReq.statusCode == HttpStatus.notFound) {
      innerReq = await makeRequest(
        request.method,
        request.requestedUri.replace(port: 5051, path: '/'),
        request.headers,
        body,
      );
    }
    final res = request.response;
    res.statusCode = innerReq.statusCode;
    innerReq.headers.forEach(res.headers.add);
    res.write(innerReq.expand((el) => el).toList());
    res.close();
  });

  final process = await Process.start(
    'webdev',
    [
      'serve',
      'web:5051',
      '--auto refresh',
      '--debug',
      '--debug-extension',
      //'--launch-in-chrome',
      '--log-requests',
    ],
    runInShell: true,
  );
  process.stderr.pipe(stderr);
  process.stdout.pipe(stdout).whenComplete(() => server.close());

  ProcessSignal.sigint.watch().listen((signal) => process.kill(signal));
}
