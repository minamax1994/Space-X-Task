import 'package:flutter/material.dart';
import 'package:space_x/functions/date_time_helper.dart';
import 'package:space_x/theme/app_theme.dart';

import 'data_card_widget.dart';

class DataCardItemWidget extends StatelessWidget {
  final CardDatum datum;

  DataCardItemWidget({@required this.datum});

  @override
  Widget build(BuildContext context) {
    String stringValue;
    if (datum.value is String) stringValue = datum.value as String;
    if (datum.value is int) stringValue = (datum.value as int).toString();
    if (datum.value is double) stringValue = (datum.value as double).toStringAsFixed(2);
    if (datum.value is bool) stringValue = (datum.value as bool).toString();
    if (datum.value is DateTime) stringValue = DateTimeHelper.format(datum.value as DateTime);
    if (datum.value is List<String>)
      stringValue =
          (datum.value as List<String>).fold("", (previousValue, element) => previousValue + "\n" + element).trim();
    return stringValue == null || stringValue.trim().isEmpty
        ? Container()
        : Padding(
            padding: EdgeInsets.all(3),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (datum.title != null)
                  Flexible(
                    flex: 1,
                    child: Text(datum.title, style: AppStyles.subtitleBoldStyle),
                  ),
                Flexible(
                  flex: 2,
                  child: Text(stringValue, style: AppStyles.subtitleStyle),
                ),
              ],
            ),
          );
  }
}
