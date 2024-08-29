import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:task_manager/constants/assets_constant.dart';
import 'package:task_manager/controllers/task_controller.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/ui/theme/app_colors.dart';
import 'package:task_manager/ui/widgets/dialogs.dart';
import 'package:task_manager/ui/widgets/loading_circle.dart';
import 'package:task_manager/ui/widgets/task.dart';

import 'empty_state.dart';

class TasksList extends GetView<TaskController> {
  const TasksList({
    super.key,
    required this.tasks,
    required this.loading,
  });

  final List<Task> tasks;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: loading
          ? const LoadingCircle()
          : tasks.isEmpty
              ? EmptyState(
                  image: Assets.emptyState,
                  message: 'You have no tasks yet!',
                )
              : ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 9.h),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    var task = tasks[index];
                    return Slidable(
                      key: ValueKey(index),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          if (!task.completed) ...[
                            SlidableAction(
                              padding: EdgeInsets.zero,
                              onPressed: (context) =>
                                  controller.markTaskComplete(task.id, true),
                              backgroundColor: AppColors.successColor,
                              foregroundColor: Colors.white,
                              icon: Icons.check,
                              label: 'Done',
                              borderRadius: BorderRadius.circular(12),
                            ),
                            SlidableAction(
                              padding: EdgeInsets.zero,
                              onPressed: (context) =>
                                  AppDialogs.editTask(task: task),
                              backgroundColor: AppColors.warningColor,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ],
                          SlidableAction(
                            padding: EdgeInsets.zero,
                            onPressed: (context) =>
                                controller.deleteTask(task.id),
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ],
                      ),
                      child: MyTask(
                        title: task.title,
                        description: task.description ?? 'No description',
                        completed: task.completed,
                      ),
                    );
                  },
                ),
    );
  }
}
