import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/launches/past/past_launches_controller.dart';
import 'package:space_x/ui_components/date_time_filter_widget.dart';
import 'package:space_x/launches/launches_list_item_widget.dart';

class PastLaunchesWidget extends StatelessWidget {
  PastLaunchesController controller;

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
        return Column(
          children: [
            DateTimeSpanPickerWidget(
              selectedDates: controller.filterDateTime,
            ),
            Flexible(
              child: state.filteredLaunches.isEmpty
                  ? Center(child: Text("No Launches Found"))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.filteredLaunches.length,
                      itemBuilder: (BuildContext context, int index) =>
                          LaunchesListItemWidget(launch: state.filteredLaunches[index]),
                    ),
            ),
          ],
        );
      }

      return Container();
    });
  }
}
