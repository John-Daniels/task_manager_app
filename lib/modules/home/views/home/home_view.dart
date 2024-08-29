import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager/modules/home/views/home/widgets/tasks_list.dart';
import 'package:task_manager/ui/theme/app_colors.dart';

import '../../../../ui/widgets/home_app_bar.dart';
import '../../../../ui/widgets/plus_button.dart';
import '../../../../ui/widgets/top_card.dart';
import '../../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: HomeAppBar(controller: controller),
        floatingActionButton: FabButton(
          onPressed: controller.addTask,
          isCompleted: controller.isCompleted,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
          padding: EdgeInsets.all(25.w),
          child: Column(
            children: [
              // const SizedBox(height: 30),
              AppSegementedControls(controller: controller.tabController),
              const SizedBox(height: 10),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    TasksList(
                      loading: controller.tasksController.loading,
                      tasks: controller.tasks,
                    ),
                    TasksList(
                      loading: controller.tasksController.loading,
                      tasks: controller.completedTasks,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppSegementedControls extends StatelessWidget {
  const AppSegementedControls({super.key, this.controller});
  final TabController? controller;

  @override
  Widget build(BuildContext context) {
    return SegmentedTabControl(
      controller: controller,
      backgroundColor: Colors.white,
      indicatorColor: AppColors.primaryColor,
      tabTextColor: Colors.black45,
      selectedTabTextColor: Colors.white,
      tabs: const [
        SegmentTab(label: 'TASKS'),
        SegmentTab(label: 'COMPLETED'),
      ],
    );
  }
}
