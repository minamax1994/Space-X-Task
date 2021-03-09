import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:space_x/launchpad/launchpad_client.dart';
import 'package:space_x/launchpad/launchpad_response.dart';

class LaunchpadController extends GetxController {
  final _client = LaunchpadClient();
  final isLoading = false.obs;
  final String launchpadId;
  Rx<LaunchpadState> state;

  LaunchpadController({@required this.launchpadId}) {
    _setState(LaunchpadInitialState());
    if (launchpadId != null) getLaunchpadById();
  }

  void getLaunchpadById() async {
    isLoading.value = true;
    try {
      var result = await _client.getLaunchpadById(id: launchpadId);
      isLoading.value = false;
      if (result.isSuccess) {
        _setState(LaunchpadSuccessState(result.data));
      } else {
        _setState(LaunchpadErrorState(result.errorMessage));
      }
    } catch (e) {
      isLoading.value = false;
      _setState(LaunchpadErrorState(_client.fallbackErrorMessage));
    }
  }

  _setState(LaunchpadState newState) {
    if (state == null) {
      state = newState.obs;
    }
    state.value = newState;
  }
}

abstract class LaunchpadState {}

class LaunchpadInitialState implements LaunchpadState {}

class LaunchpadErrorState implements LaunchpadState {
  final String errorMessage;

  LaunchpadErrorState(this.errorMessage);
}

class LaunchpadSuccessState implements LaunchpadState {
  final Launchpad launchpad;

  LaunchpadSuccessState(this.launchpad);
}
