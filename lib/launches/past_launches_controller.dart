import 'package:get/get.dart';
import 'package:space_x/launches/launches_client.dart';
import 'package:space_x/launches/launches_response.dart';

class PastLaunchesController extends GetxController {
  final _client = LaunchesClient();
  final isLoading = false.obs;
  Rx<LaunchesState> state;

  PastLaunchesController() {
    _setState(InitialState());
    getPastLaunches();
  }

  void getPastLaunches() async {
    isLoading.value = true;
    try {
      var result = await _client.getPastLaunches();
      isLoading.value = false;
      if (result.isSuccess) {
        var launches = result.data;
        launches.sort((a, b) => b.flightNumber - a.flightNumber);
        _setState(SuccessState(launches));
      } else {
        _setState(ErrorState(result.errorMessage));
      }
    } catch (e) {
      isLoading.value = false;
      _setState(ErrorState(_client.fallbackErrorMessage));
    }
  }

  _setState(LaunchesState newState) {
    if (state == null) {
      state = newState.obs;
    }
    state.value = newState;
  }
}

abstract class LaunchesState {}

class InitialState implements LaunchesState {}

class ErrorState implements LaunchesState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

class SuccessState implements LaunchesState {
  final List<Launch> launches;

  SuccessState(this.launches);
}
