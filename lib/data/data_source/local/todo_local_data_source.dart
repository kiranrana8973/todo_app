import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/core/failure/failure.dart';
import 'package:todo_app/data/data_source/main_data_source.dart';
import 'package:todo_app/domain/entity/todo_entity.dart';

class TodoLocalDataSource extends MainDataSource {
  @override
  Future<Either<Failure, bool>> createTodo(
      {required String title, required String description}) {
    // TODO: implement createTodo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> getTodoList() async {
    try {
      final data = await rootBundle.loadString('data/todos.json');
      return const Right([]);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateTodo(TodoEntity todoEntity) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }
}
