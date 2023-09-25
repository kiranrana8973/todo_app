class TodoEntity {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final bool isPinned;

  TodoEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.isPinned,
  });
}
