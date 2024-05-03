import 'package:dart_frog/dart_frog.dart';
import 'package:frog_demo/constants/responses.dart';
import 'package:frog_demo/repositories/student_repository.dart';
import 'package:frog_demo/utils/logger.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method == HttpMethod.get) {
    final params = context.request.uri.queryParameters;
    Log().d('params: $params');

    if (params.containsKey('id') && params['id'] != null) {
      try {
        final student =
            await StudentRepository().readStudent(id: params['id']!);
        return commonSuccessResponse(
          'student fetched successfully.',
          data: student.toJson(),
        );
      } catch (e) {
        return commonNegativeReponse('User with given id is not found.');
      }
    }

    return commonSuccessResponse(
      'students fetched successfully',
      listResp: await StudentRepository().getAllstudents(),
    );
  } else {
    return invalidMethodResp;
  }
}
