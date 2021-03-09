import 'package:flutter/cupertino.dart';
import 'package:space_x/api/api_calls.dart';
import 'package:space_x/api/api_result.dart';
import 'package:space_x/launchpad/launchpad_response.dart';

class LaunchpadClient {
  final fallbackErrorMessage = "An Error Occurred, Please Try Again.";

  Future<ApiResult<Launchpad>> getLaunchpadById({@required String id}) async {
    var relativeUrl = "/launchpads/$id";
    var response = await ApiCalls.get(relativeUrl);
    try {
      final result = Launchpad.fromJson(response.body);

      if (response.statusCode == 200) {
        return ApiResult<Launchpad>(isSuccess: true, data: result);
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
