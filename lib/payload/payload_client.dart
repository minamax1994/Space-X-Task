import 'package:flutter/cupertino.dart';
import 'package:space_x/api/api_calls.dart';
import 'package:space_x/api/api_result.dart';
import 'package:space_x/payload/payload_response.dart';

class PayloadClient {
  final fallbackErrorMessage = "An Error Occurred, Please Try Again.";

  Future<ApiResult<Payload>> getPayloadById({@required String id}) async {
    var relativeUrl = "/payloads/$id";
    var response = await ApiCalls.get(relativeUrl);
    try {
      final result = Payload.fromJson(response.body);

      if (response.statusCode == 200) {
        return ApiResult<Payload>(isSuccess: true, data: result);
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
