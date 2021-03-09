import 'package:flutter/material.dart';

// Unified API result to be used in both success and error cases.

class ApiResult<T> {
  final T data;
  final bool isSuccess;
  final String errorMessage;

  ApiResult({@required this.isSuccess, this.data, this.errorMessage});
}
