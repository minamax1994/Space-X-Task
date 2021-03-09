import 'package:get/get.dart';
import 'package:space_x/functions/date_time_helper.dart';
import 'package:space_x/launches/launches_client.dart';
import 'package:space_x/launches/launches_response.dart';
import 'package:space_x/ui_components/date_time_filter_widget.dart';

class PastLaunchesController extends GetxController {
  final _client = LaunchesClient();
  final isLoading = false.obs;
  Rx<LaunchesState> state;
  Rx<DateTimeSpan> filterDateTime = DateTimeSpan(start: null, end: null).obs;

  PastLaunchesController() {
    _initializeListeners();
    _setState(InitialState());
    getPastLaunches();
  }

  void _initializeListeners() {
    filterDateTime.listen((_) => _filterLaunches());
  }

  void _filterLaunches() {
    var st = _ensureState<SuccessState>();
    var filteredLaunches = List<Launch>();
    if (filterDateTime.value?.start == null || filterDateTime.value?.end == null) {
      filteredLaunches = st.launches;
    } else {
      st.launches.forEach((launch) {
        var start = DateTimeHelper.normalizeToDays(filterDateTime.value.start);
        var end = DateTimeHelper.normalizeToDays(filterDateTime.value.end);
        var launchDate = DateTimeHelper.normalizeToDays(launch.dateUtc.toLocal());
        if ((launchDate.isAfter(start) || launchDate.isAtSameMomentAs(start)) &&
            (launchDate.isBefore(end) || launchDate.isAtSameMomentAs(end))) {
          filteredLaunches.add(launch);
        }
      });
    }
    _setState(SuccessState(st.launches, filteredLaunches));
  }

  void getPastLaunches() async {
    isLoading.value = true;
    try {
      var result = await _client.getPastLaunches();
      isLoading.value = false;
      if (result.isSuccess) {
        var launches = result.data;
        launches.sort((a, b) => b.flightNumber - a.flightNumber);
        _setState(SuccessState(launches, launches));
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

  TState _ensureState<TState>() {
    var currentState = state?.value as TState;
    if (currentState == null) {
      throw Exception("No loaded state");
    }
    return currentState;
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
  final List<Launch> filteredLaunches;

  SuccessState(this.launches, this.filteredLaunches);
}
