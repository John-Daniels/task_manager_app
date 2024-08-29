import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/widgets/text_field.dart';

import '../../controllers/task_controller.dart';
import '../../models/task.dart';

class EditTaskDialog extends StatefulWidget {
  final Task task;

  const EditTaskDialog({
    required this.task,
    super.key,
  });

  @override
  State<EditTaskDialog> createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  late bool isCompleted;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with existing task data
    isCompleted = widget.task.completed;
    title.text = widget.task.title;
    description.text = widget.task.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.only(
        bottom: 10,
        right: 15,
      ),
      title: Text(
        'E D I T  T A S K',
        style: TextStyle(
          fontSize: 16.sp,
        ),
        textAlign: TextAlign.center,
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Incomplete'),
                Switch(
                  value: isCompleted,
                  onChanged: (newValue) {
                    setState(() {
                      isCompleted = newValue;
                    });
                  },
                ),
                const Text('Completed'),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  AppTextField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Enter a title';
                      }
                      return null;
                    },
                    controller: title,
                    hintText: 'Title',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  AppTextField(
                    hintText: 'Description (optional)',
                    controller: description,
                    validator: (value) {
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        GetBuilder<TaskController>(
          builder: (controller) {
            return TextButton(
              child: const Text('Save Changes'),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.updateTask({
                    'id': widget.task.id,
                    'title': title.text,
                    'description': description.text,
                    'completed': isCompleted,
                  });
                }
              },
            );
          },
        ),
      ],
    );
  }
}
