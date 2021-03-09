import 'package:space_x/api/api_calls.dart';
import 'package:space_x/api/api_result.dart';
import 'package:space_x/launches/launches_response.dart';

class LaunchesClient {
  final fallbackErrorMessage = "An Error Occurred, Please Try Again.";

  Future<ApiResult<Launch>> getNextLaunch() async {
    var relativeUrl = "/launches/next";
    var response = await ApiCalls.get(relativeUrl);
    try {
      final result = Launch.fromJson(response.body);

      if (response.statusCode == 200) {
        return ApiResult<Launch>(isSuccess: true, data: result);
      }
    } catch (e) {
      print(e.toString());
    }
    return ApiResult(
      isSuccess: false,
      errorMessage: fallbackErrorMessage,
    );
  }

  Future<ApiResult<List<Launch>>> getPastLaunches() async {
    var relativeUrl = "/launches/past";
    var response = await ApiCalls.get(relativeUrl);
    try {
      final result = Launch.listFromJson(response.body);

      if (response.statusCode == 200) {
        return ApiResult<List<Launch>>(isSuccess: true, data: result);
      }
    } catch (e) {
      print(e.toString());
    }
    return ApiResult(
      isSuccess: false,
      errorMessage: fallbackErrorMessage,
    );
  }
}
