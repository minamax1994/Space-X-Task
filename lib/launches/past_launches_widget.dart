import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/launches/past_launches_controller.dart';
import 'package:space_x/ui_components/date_time_filter_widget.dart';
import 'file:///C:/Users/MinaHamdy/FlutterProjects/space_x/lib/launches/launches_list_item_widget.dart';

class PastLaunchesWidget extends StatefulWidget {
  @override
  _PastLaunchesWidgetState createState() => _PastLaunchesWidgetState();
}

class _PastLaunchesWidgetState extends State<PastLaunchesWidget> {
  PastLaunchesController controller;

  @override
  void initState() {
    controller = Get.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
