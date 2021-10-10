import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/providers/checkbox_provider.dart';
import 'package:learning/screens/addtask_screen.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({Key? key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // Widget buildButtomSheet(BuildContext context) => Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => AddTaskScreen());
          },
          child: Icon(Icons.add),
        ),
        body: SafeArea(
          child: Consumer(builder: (context, watch, child) {
            final taskH = watch(tolistDataProvider);

            final countlistData =
                context.read(tolistDataProvider.notifier).taskcount;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 40,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 20),
                  child: Text(
                    "To do",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 10.0, left: 20),
                    child: Text(
                      '${countlistData.toString()} Tasks',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.only(top: 10.0, left: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      child: ListView.builder(
                          itemCount: countlistData,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(
                                  taskH[index].taskname,
                                  style: TextStyle(
                                      decoration: taskH[index].isDone
                                          ? TextDecoration.lineThrough
                                          : null),
                                ),
                                trailing: Checkbox(
                                  activeColor: Colors.lightBlueAccent,
                                  value: taskH[index].isDone,
                                  onChanged: (value) {
                                    context
                                        .read(tolistDataProvider.notifier)
                                        .ChangeStatus(index);
                                  },
                                ));
                          })),
                ),
                // Consumer(builder: (context, watch, child) {
                //   return Center(
                //       child: Text(
                //     watch(counterProvider).toString(),
                //     style: TextStyle(fontSize: 30),
                //   ));
                // }),
                // ElevatedButton(
                //     onPressed: () {
                //       context.read(counterProvider.notifier).add();
                //     },
                //     child: Text("add")),
                // ElevatedButton(
                //     onPressed: () {
                //       context.read(counterProvider.notifier).sub();
                //     },
                //     child: Text("sub"))
              ],
            );
          }),
        ));
  }
}
