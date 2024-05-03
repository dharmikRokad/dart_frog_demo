import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:frog_demo/constants/responses.dart';
import 'package:frog_demo/utils/logger.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    final body =
        jsonDecode(await context.request.body()) as Map<String, dynamic>;
    Log().d(body.toString());

    // if (students.any((element) => element.id == params['id'])) {
    //   return commonNegativeReponse('User is already exist');
    // }

    writeToFile(body['data'].toString());

    return commonSuccessResponse(
      'User added successfully',
      data: {
        'data': body['data'].toString(),
      },
    );
  } else {
    return invalidMethodResp;
  }
}

void writeToFile(String content) {
  // Define the file path
  const filePath = 'example.txt';

  // Create a File object
  final file = File(filePath);

  // Write content to the file
  file
      .writeAsString(content)
      .then((file) => print('Content written to file successfully!'))
      .catchError((error) => print('Error writing to file: $error'));
}
