import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/models/task_model.dart';

import '../const.dart';

class TodolistData extends StateNotifier<List<TaskModel>> {
  TodolistData() : super(task);

  void ChangeStatus(int index) {
    state[index].isDone = !state[index].isDone;
    state = [...state];
  }

  int get taskcount {
    return task.length;
  }

  void addTask({required String newTasktitle}) {
    final newTodo = TaskModel(taskname: newTasktitle);
    task.add(newTodo);
    print(task);
  }
}

final tolistDataProvider = StateNotifierProvider<TodolistData, List<TaskModel>>(
    (ref) => TodolistData());




// final counterProvider =
//     StateNotifierProvider<CounterNotifier, dynamic>((ref) => CounterNotifier());

// class CounterNotifier extends StateNotifier {
//   CounterNotifier() : super(0);

//   void add() {
//     state = state + 1;
//   }

//   void sub() {
//     state = state - 1;
//   }
// }
