import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/functions/date_time_helper.dart';

class DateTimeSpan {
  final DateTime start;
  final DateTime end;

  DateTimeSpan({@required this.start, @required this.end});
}

class DateTimeSpanPickerWidget extends StatelessWidget {
  final Rx<DateTimeSpan> selectedDates;

  DateTimeSpanPickerWidget({@required this.selectedDates});

  bool get hasValues =>
      selectedDates.value != null && selectedDates.value.start != null || selectedDates.value.end != null;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var now = DateTimeHelper.normalizeToDays(DateTime.now());
      var picker = DateTimeRangePicker(
          startText: "From",
          endText: "To",
          doneText: "Done",
          cancelText: "Cancel",
          initialStartTime: selectedDates.value?.start ?? now.subtract(Duration(days: 7)),
          initialEndTime: selectedDates.value?.end ?? now,
          interval: 5,
          maximumTime: now,
          mode: DateTimeRangePickerMode.date,
          onConfirm: (start, end) {
            printInfo(info: start.toString());
            printInfo(info: end.toString());
            if (end.isBefore(start)) {
              Get.showSnackbar(GetBar(
                message: "End Date Can't Be Before Start Date",
                animationDuration: Duration(milliseconds: 100),
                duration: Duration(seconds: 3),
              ));
            } else {
              selectedDates.value = DateTimeSpan(
                start: DateTimeHelper.normalizeToDays(start.toLocal()), //start of the day
                end: DateTimeHelper.normalizeToDays(end.toLocal()), //end of the day
              );
            }
          });

      return ListTile(
        leading: Icon(Icons.calendar_today_outlined),
        trailing: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            selectedDates.value = DateTimeSpan(start: null, end: null);
          },
        ),
        title: hasValues
            ? Text(DateTimeHelper.getStringSelectedSpan(selectedDates.value.start, selectedDates.value.end))
            : Text("Filter By Date"),
        onTap: () => picker.showPicker(context),
      );
    });
  }
}
