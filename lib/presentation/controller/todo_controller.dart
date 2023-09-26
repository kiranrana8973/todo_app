import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/domain/usecase/get_all_todos_usecase.dart';
import 'package:todo_app/presentation/state/todo_state.dart';

final todoControllerProvider =
    StateNotifierProvider<TodoController, TodoState>((ref) {
  final getAllTodoUseCase = ref.watch(getAllTodoUsecaseProvider);
  return TodoController(getAllTodoUseCase);
});

class TodoController extends StateNotifier<TodoState> {
  final GetAllTodoUseCase getAllTodoUseCase;

  TodoController(this.getAllTodoUseCase) : super(TodoState.initial()) {
    getAllTodos();
  }

  void getAllTodos() async {
    state = state.copyWith(isLoading: true);
    var todos = await getAllTodoUseCase.execute();
    todos.fold((l) {
      return state = state.copyWith(error: l.message);
    }, (r) {
      return state = state.copyWith(todos: r);
    });
    state = state.copyWith(isLoading: false);
  }
}
