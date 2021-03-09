import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/launches/launches_response.dart';
import 'package:space_x/launchpad/launchpad_controller.dart';
import 'package:space_x/payload/payload_controller.dart';
import 'package:space_x/rocket/rocket_controller.dart';
import 'package:space_x/theme/app_theme.dart';
import 'package:space_x/ui_components/data_card_widget.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class LaunchDetailsScreen extends StatelessWidget {
  final Launch launch;
  LaunchpadController launchpadController;
  RocketController rocketController;
  PayloadController payloadController;

  LaunchDetailsScreen(this.launch);

  @override
  Widget build(BuildContext context) {
    launchpadController = LaunchpadController(launchpadId: launch.launchpad);
    rocketController = RocketController(rocketId: launch.rocket);
    payloadController = PayloadController(payloadId: launch.payloads?.first);
    return Scaffold(
      appBar: AppBar(
        title: Text(launch.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildLaunchDetails(),
            buildLaunchpadDetails(),
            buildRocketDetails(),
            buildPayloadDetails(),
            SizedBox(height: 50),
          ],
        ),
      ),
      floatingActionButton: buildVideoButton(),
    );
  }

  Widget buildVideoButton() {
    return launch.links?.webcast == null || launch.links.webcast.trim().isEmpty
        ? Container()
        : FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.ondemand_video, color: AppColors.primaryContrastingColor),
            onPressed: () async => await url.canLaunch(launch.links?.webcast)
                ? await url.launch(launch.links?.webcast)
                : Get.showSnackbar(
                    GetBar(
                      message: "Could not launch url.",
                      duration: Duration(seconds: 3),
                      animationDuration: Duration(milliseconds: 100),
                    ),
                  ),
          );
  }

  buildLaunchDetails() {
    return DataCardWidget(label: "Launch", data: [
      CardDatum("Name", launch.name),
      CardDatum("Date", launch.dateUtc.toLocal()),
      CardDatum(null, launch.details),
    ]);
  }

  buildLaunchpadDetails() {
    return Obx(() {
      var state = launchpadController.state?.value;
      var isLoading = launchpadController.isLoading?.value;

      if (isLoading) {
        return buildLoadingWidget();
      }

      if (state is LaunchpadErrorState) {
        return buildErrorWidget(state.errorMessage);
      }

      if (state is LaunchpadSuccessState) {
        return DataCardWidget(label: "Launchpad", data: [
          CardDatum("Name", state.launchpad.name),
          CardDatum("Full Name", state.launchpad.fullName),
          CardDatum("Locality", state.launchpad.locality),
          CardDatum("Timezone", state.launchpad.timezone),
          CardDatum("Status", state.launchpad.status),
          CardDatum(
            "Launch Successes",
            state.launchpad.launchSuccesses.toString() + " of " + state.launchpad.launchAttempts.toString(),
          ),
        ]);
      }

      return Container();
    });
  }

  buildRocketDetails() {
    return Obx(() {
      var state = rocketController.state?.value;
      var isLoading = rocketController.isLoading?.value;

      if (isLoading) {
        return buildLoadingWidget();
      }

      if (state is RocketErrorState) {
        return buildErrorWidget(state.errorMessage);
      }

      if (state is RocketSuccessState) {
        return DataCardWidget(label: "Rocket", data: [
          CardDatum("Name", state.rocket.name),
          CardDatum(null, state.rocket.description),
          CardDatum("Type", state.rocket.type),
          CardDatum("Country", state.rocket.country),
          CardDatum("Company", state.rocket.company),
          CardDatum("Active", state.rocket.active),
          CardDatum("Height", state.rocket.height.meters.toStringAsFixed(2) + " m"),
          CardDatum("Diameter", state.rocket.diameter.meters.toStringAsFixed(2) + " m"),
        ]);
      }

      return Container();
    });
  }

  buildPayloadDetails() {
    return Obx(() {
      var state = payloadController.state?.value;
      var isLoading = payloadController.isLoading?.value;

      if (isLoading) {
        return buildLoadingWidget();
      }

      if (state is PayloadErrorState) {
        return buildErrorWidget(state.errorMessage);
      }

      if (state is PayloadSuccessState) {
        return DataCardWidget(label: "Payload", data: [
          CardDatum("Name", state.payload.name),
          CardDatum("Type", state.payload.type),
          CardDatum("Nationalities", state.payload.nationalities),
          CardDatum("Manufacturers", state.payload.manufacturers),
          CardDatum("Customers", state.payload.customers),
          CardDatum("Reference System", state.payload.referenceSystem),
          CardDatum("Reused", state.payload.reused),
        ]);
      }

      return Container();
    });
  }

  SizedBox buildLoadingWidget() => SizedBox(height: 50, child: Center(child: CircularProgressIndicator()));

  Widget buildErrorWidget(String errorMessage) => Center(child: Text(errorMessage));
}
