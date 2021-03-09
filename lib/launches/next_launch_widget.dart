import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/launches/next_launch_controller.dart';
import 'package:space_x/theme/app_theme.dart';

class NextLaunchWidget extends StatefulWidget {
  @override
  _NextLaunchWidgetState createState() => _NextLaunchWidgetState();
}

class _NextLaunchWidgetState extends State<NextLaunchWidget> {
  NextLaunchController launchesController;

  @override
  void initState() {
    launchesController = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var state = launchesController.state?.value;
      var isLoading = launchesController.isLoading?.value;

      if (isLoading) {
        return Center(child: CircularProgressIndicator());
      }

      if (state is ErrorState) {
        return Center(child: Text(state.errorMessage));
      }

      if (state is SuccessState) {
        return buildDetails(state);
      }

      return Container();
    });
  }
}

Widget buildDetails(SuccessState state) {
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