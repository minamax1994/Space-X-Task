import 'package:http/http.dart' as http;

import 'api_configurations.dart';

// Used to unify all API calls.
// Any analytics data and authorization handling should be done here

class ApiCalls {
  static Future<http.Response> get(String relativeUrl) async {
    final url = ApiConfigurations.baseUrl + relativeUrl;

    print("GET: " + url);

    var response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    print("OUTPUT ${response.statusCode.toString()} : " + response.body.toString());

    return response;
  }
}
