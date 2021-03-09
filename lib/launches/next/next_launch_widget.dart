import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/launches/details/launch_details_screen.dart';
import 'package:space_x/launches/next/next_launch_controller.dart';
import 'package:space_x/theme/app_theme.dart';

class NextLaunchWidget extends StatelessWidget {
  NextLaunchController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find();

    return Obx(() {
      var state = controller.state?.value;
      var isLoading = controller.isLoading?.value;

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
        style: AppStyles.titleStyle,
        children: <TextSpan>[
          TextSpan(
            text: "Next launch of\n\n",
          ),
          TextSpan(
            text: state.launch.name,
            style: AppStyles.headerStyle.copyWith(decoration: TextDecoration.underline),
            recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => LaunchDetailsScreen(state.launch)),
          ),
          TextSpan(
            text: "\n\n will be in\n\n",
          ),
          TextSpan(
            text: state.countdownTimer.value,
            style: AppStyles.headerStyle,
          ),
        ],
      ),
    ),
  );
}
