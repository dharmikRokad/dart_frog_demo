import 'dart:convert';
import 'package:dart_frog/dart_frog.dart';
import 'package:frog_demo/constants/responses.dart';
import 'package:frog_demo/extensions/string_ext.dart';
import 'package:frog_demo/repositories/student_repository.dart';
import 'package:frog_demo/utils/logger.dart';
import 'package:frog_demo/utils/utils.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    final body =
        jsonDecode(await context.request.body()) as Map<String, dynamic>;
    Log().d(body);

    if (!body.containsKey('id') || body['id'] == null) {
      return commonNegativeReponse('student id is required.');
    }

    if (!students.any((element) => element.id == body['id'])) {
      return commonNegativeReponse('Student with given id is not found.');
    }

    final updatedStudent = await StudentRepository().updateStudent(
      id: body['id'].toString(),
      name: body['name'] as String?,
      age: Utils().parseInt(body['age'].toString()),
      dob: body['dob'].toString().toDateTime,
    );

    return commonSuccessResponse(
      'Student updated successfully.',
      data: updatedStudent.toJson(),
    );
  } else {
    return invalidMethodResp;
  }
}
