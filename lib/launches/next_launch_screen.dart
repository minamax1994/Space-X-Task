import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/launches/launches_controller.dart';
import 'package:space_x/theme/app_theme.dart';

class NextLaunchScreen extends StatefulWidget {
  @override
  _NextLaunchScreenState createState() => _NextLaunchScreenState();
}

class _NextLaunchScreenState extends State<NextLaunchScreen> {
  final launchesController = LaunchesController();

  @override
  void initState() {
    launchesController.getNextLaunch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: buildNextLaunch(context),
          ),
        ],
      ),
    );
  }

  Widget buildNextLaunch(BuildContext context) {
    return Obx(() {
      var state = launchesController.state?.value;
      var isLoading = launchesController.isLoading?.value;

      if (isLoading) {
        return Center(child: CircularProgressIndicator());
      }

      if (state is InitialState) {
        return Container();
      }

      if (state is ErrorState) {
        return Center(child: Text(state.errorMessage));
      }

      if (state is SuccessState) {
        return Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppStyles.subtitleStyle,
              children: <TextSpan>[
                TextSpan(
                  text: "Next launch of\n\n",
                ),
                TextSpan(
                  text: state.launch.name,
                  style: AppStyles.titleStyle,
                ),
                TextSpan(
                  text: "\n\n will be in\n\n",
                ),
                TextSpan(
                  text: state.countdownTimer.value,
                  style: AppStyles.titleStyle,
                ),
              ],
            ),
          ),
        );
      }

      return Container();
    });
  }
}
