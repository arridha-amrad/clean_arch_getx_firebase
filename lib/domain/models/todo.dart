class Todo {
  String? todoId;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isDone;

  Todo({
    this.todoId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.isDone,
  });

  Map<String, dynamic> toJson() => {
        "todoId": todoId ?? "",
        "title": title,
        "description": description,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
      };
}
