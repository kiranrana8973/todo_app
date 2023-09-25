class TodoModel {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final bool isPinned;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.isPinned,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
      isPinned: json['isPinned'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'isPinned': isPinned,
    };
  }
}
