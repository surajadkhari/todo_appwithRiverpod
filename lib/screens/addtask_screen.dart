import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:learning/models/task_model.dart';
import 'package:learning/providers/checkbox_provider.dart';

import '../const.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController inputTask = TextEditingController();
    return Consumer(builder: (context, watch, child) {
      return Container(
        color: Color(0xff757575),
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Add Task",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  autocorrect: true,
                  textAlign: TextAlign.center,
                  controller: inputTask,
                  onChanged: (value) {
                    value = inputTask.text;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read(tolistDataProvider.notifier)
                          .addTask(newTasktitle: inputTask.text);
                      Navigator.pop(context);
                    },
                    child: Text("Add"))
              ],
            ),
          ),
        ),
      );
    });
  }
}
