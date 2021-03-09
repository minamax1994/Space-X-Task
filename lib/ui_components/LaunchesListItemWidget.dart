import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
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
      subtitle: Text(launch.dateUtc.toLocal().format(DateTimeFormats.american), style: AppStyles.subtitleStyle),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        //TODO Launch Details
      },
    );
  }
}
