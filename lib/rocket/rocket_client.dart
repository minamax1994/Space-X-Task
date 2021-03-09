import 'package:flutter/cupertino.dart';
import 'package:space_x/api/api_calls.dart';
import 'package:space_x/api/api_result.dart';
import 'package:space_x/rocket/rocket_response.dart';

class RocketClient {
  final fallbackErrorMessage = "An Error Occurred, Please Try Again.";

  Future<ApiResult<Rocket>> getRocketById({@required String id}) async {
    var relativeUrl = "/rockets/$id";
    var response = await ApiCalls.get(relativeUrl);
    try {
      final result = Rocket.fromJson(response.body);

      if (response.statusCode == 200) {
        return ApiResult<Rocket>(isSuccess: true, data: result);
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
