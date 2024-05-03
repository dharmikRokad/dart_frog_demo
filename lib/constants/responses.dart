import 'dart:io';
import 'package:dart_frog/dart_frog.dart';

/// Invalid method response
final Response invalidMethodResp = Response.json(
  statusCode: HttpStatus.badRequest,
  body: {
    'status': false,
    'message': 'Invalid method type',
  },
);

/// constant method for returning negetive response
Response commonNegativeReponse(String message) => Response.json(
      statusCode: HttpStatus.badRequest,
      body: {
        'status': false,
        'message': message,
      },
    );

/// constant method for returning positive response
Response commonSuccessResponse(
  String message, {
  Map<String, dynamic>? data,
  List<dynamic>? listResp,
}) {
  final responseToReturn = {
    'status': true,
    'message': message,
  };
  if (data != null) responseToReturn.addAll({'data': data});
  if (listResp != null) responseToReturn.addAll({'data': listResp});

  return Response.json(
    body: responseToReturn,
  );
}
