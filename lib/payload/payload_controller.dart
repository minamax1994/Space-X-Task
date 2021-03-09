import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/payload/payload_client.dart';
import 'package:space_x/payload/payload_response.dart';

class PayloadController extends GetxController {
  final _client = PayloadClient();
  final isLoading = false.obs;
  final String payloadId;
  Rx<PayloadState> state;

  PayloadController({@required this.payloadId}) {
    _setState(PayloadInitialState());
    if (payloadId != null) getPayloadById();
  }

  void getPayloadById() async {
    isLoading.value = true;
    try {
      var result = await _client.getPayloadById(id: payloadId);
      isLoading.value = false;
      if (result.isSuccess) {
        _setState(PayloadSuccessState(result.data));
      } else {
        _setState(PayloadErrorState(result.errorMessage));
      }
    } catch (e) {
      isLoading.value = false;
      _setState(PayloadErrorState(_client.fallbackErrorMessage));
    }
  }

  _setState(PayloadState newState) {
    if (state == null) {
      state = newState.obs;
    }
    state.value = newState;
  }
}

abstract class PayloadState {}

class PayloadInitialState implements PayloadState {}

class PayloadErrorState implements PayloadState {
  final String errorMessage;

  PayloadErrorState(this.errorMessage);
}

class PayloadSuccessState implements PayloadState {
  final Payload payload;

  PayloadSuccessState(this.payload);
}
