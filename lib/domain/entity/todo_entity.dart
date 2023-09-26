import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int id;
  final String title;
  final String description;
  final bool isCompleted;
  final bool isPinned;

  const TodoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.isPinned,
  });

  @override
  List<Object?> get props => [id, title, description, isCompleted, isPinned];
}
