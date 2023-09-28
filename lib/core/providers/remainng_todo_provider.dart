import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/presentation/controller/todo_controller.dart';

final remianingTodoProvider = StateProvider<int>((ref) {
  final todos = ref.watch(todoControllerProvider).todos;
  var remainingTodos = todos.where((element) => !element.isCompleted).toList();
  return remainingTodos.length;
});
