import 'package:dart_frog/dart_frog.dart';
import 'package:frog_demo/constants/responses.dart';
import 'package:frog_demo/repositories/student_repository.dart';
import 'package:frog_demo/utils/logger.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.delete) {
    final params = context.request.uri.queryParameters;
    Log().d('params: $params');

    if (!params.containsKey('id')) {
      return commonNegativeReponse('User id is required');
    }

    if (!students.any((element) => element.id == params['id'])) {
      return commonNegativeReponse('User with given id is not found.');
    }

    await StudentRepository().deleteStudent(id: params['id']!);
    return commonSuccessResponse('User deleted successfully');
  } else {
    return invalidMethodResp;
  }
}
