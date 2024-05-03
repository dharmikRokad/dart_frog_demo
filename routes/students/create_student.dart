import 'dart:convert';
import 'package:dart_frog/dart_frog.dart';
import 'package:frog_demo/constants/responses.dart';
import 'package:frog_demo/extensions/string_ext.dart';
import 'package:frog_demo/repositories/student_repository.dart';
import 'package:frog_demo/utils/logger.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.post) {
    final params =
        jsonDecode(await context.request.body()) as Map<String, dynamic>;
    Log().d(params.toString());

    // if (students.any((element) => element.id == params['id'])) {
    //   return commonNegativeReponse('User is already exist');
    // }

    if (params['name'] == null) {
      return commonNegativeReponse('Name is required.');
    }

    if (params['age'] == null) {
      return commonNegativeReponse('Age is required.');
    }

    final user = await StudentRepository().createStudent(
      name: params['name'].toString(),
      age: int.parse(params['age'].toString()),
      dob: params['dob'].toString().toDateTime,
    );
    return commonSuccessResponse(
      'User added successfully',
      data: user.toJson(),
    );
  } else {
    return invalidMethodResp;
  }
}
