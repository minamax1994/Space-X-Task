import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/functions/date_time_helper.dart';
import 'package:space_x/launches/details/launch_details_screen.dart';
import 'package:space_x/launches/launches_response.dart';
import 'package:space_x/theme/app_theme.dart';

class LaunchesListItemWidget extends StatelessWidget {
  final Launch launch;

  LaunchesListItemWidget({@required this.launch});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("#" + launch.flightNumber.toString()),
      title: Text(launch.name, style: AppStyles.titleStyle),
      subtitle: Text(DateTimeHelper.format(launch.dateUtc.toLocal()), style: AppStyles.subtitleStyle),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () => Get.to<LaunchDetailsScreen>(() => LaunchDetailsScreen(launch)),
    );
  }
}
