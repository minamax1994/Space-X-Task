import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/rocket/rocket_client.dart';
import 'package:space_x/rocket/rocket_response.dart';

class RocketController extends GetxController {
  final _client = RocketClient();
  final isLoading = false.obs;
  final String rocketId;
  Rx<RocketState> state;

  RocketController({@required this.rocketId}) {
    _setState(RocketInitialState());
    if (rocketId != null) getRocketById();
  }

  void getRocketById() async {
    isLoading.value = true;
    try {
      var result = await _client.getRocketById(id: rocketId);
      isLoading.value = false;
      if (result.isSuccess) {
        _setState(RocketSuccessState(result.data));
      } else {
        _setState(RocketErrorState(result.errorMessage));
      }
    } catch (e) {
      isLoading.value = false;
      _setState(RocketErrorState(_client.fallbackErrorMessage));
    }
  }

  _setState(RocketState newState) {
    if (state == null) {
      state = newState.obs;
    }
    state.value = newState;
  }
}

abstract class RocketState {}

class RocketInitialState implements RocketState {}

class RocketErrorState implements RocketState {
  final String errorMessage;

  RocketErrorState(this.errorMessage);
}

class RocketSuccessState implements RocketState {
  final Rocket rocket;

  RocketSuccessState(this.rocket);
}
