import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/launches/next/next_launch_controller.dart';
import 'package:space_x/launches/next/next_launch_widget.dart';
import 'package:space_x/launches/past/past_launches_controller.dart';
import 'package:space_x/launches/past/past_launches_widget.dart';

class Page {
  final String title;
  final Widget icon;
  final Widget widget;

  Page({@required this.title, @required this.icon, @required this.widget});
}

class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({this.title});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = [
    Page(title: "Next Launch", icon: Icon(Icons.launch), widget: NextLaunchWidget()),
    Page(title: "Past Launches", icon: Icon(Icons.timelapse), widget: PastLaunchesWidget()),
  ];

  @override
  void initState() {
    Get.put(NextLaunchController());
    Get.put(PastLaunchesController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<NextLaunchController>();
    Get.delete<PastLaunchesController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pages.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title ?? ""),
          bottom: TabBar(
            tabs: pages.map((page) => Tab(text: page.title, icon: page.icon)).toList(),
          ),
        ),
        body: TabBarView(
          children: pages.map((page) => page.widget).toList(),
        ),
      ),
    );
  }
}
