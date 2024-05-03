import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  final message = context.read<String>();
  return Response.json(
    body: {
      'status': true,
      'message': 'This the first route creating by @dharmik with dart',
      'provided': message,
    },
  );
}
