import 'dart:async';

import 'package:duration/duration.dart';
import 'package:get/get.dart';
import 'package:space_x/launches/launches_client.dart';
import 'package:space_x/launches/launches_response.dart';

class NextLaunchController extends GetxController {
  final _client = LaunchesClient();
  final isLoading = false.obs;
  Rx<LaunchState> state;
  Timer timer;

  NextLaunchController() {
    _setState(InitialState());
    getNextLaunch();
  }

  void getNextLaunch() async {
    isLoading.value = true;
    try {
      var result = await _client.getNextLaunch();
      isLoading.value = false;
      if (result.isSuccess) {
        _setState(SuccessState(result.data));
        _startCountdownTimer();
      } else {
        _setState(ErrorState(result.errorMessage));
      }
    } catch (e) {
      isLoading.value = false;
      _setState(ErrorState(_client.fallbackErrorMessage));
    }
  }

  void _startCountdownTimer() {
    var state = _ensureState<SuccessState>();
    timer = Timer.periodic(Duration(milliseconds: 500), (_) {
      state.countdownTimer.value = _getFormattedRemainingTimeToLaunch(state.launch.dateUtc);
    });
  }

  String _getFormattedRemainingTimeToLaunch(DateTime launchDate) {
    var time = launchDate.toLocal().toLocal().difference(DateTime.now());
    return prettyDuration(time, abbreviated: true, delimiter: " : ");
  }

  _setState(LaunchState newState) {
    if (state == null) {
      state = newState.obs;
    }
    state.value = newState;
  }

  TState _ensureState<TState>() {
    var currentState = state?.value as TState;
    if (currentState == null) {
      throw Exception("No loaded state");
    }
    return currentState;
  }
}

abstract class LaunchState {}

class InitialState implements LaunchState {}

class ErrorState implements LaunchState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

class SuccessState implements LaunchState {
  final Launch launch;
  final RxString countdownTimer = "".obs;

  SuccessState(this.launch);
}
