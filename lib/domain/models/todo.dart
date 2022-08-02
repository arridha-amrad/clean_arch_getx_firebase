class Todo {
  String? id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String dueTime;
  final bool isDone;
  final String userId;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.dueTime,
    required this.isDone,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
      title: json["title"],
      description: json["description"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      dueTime: json["dueTime"],
      isDone: json["isDone"],
      userId: json["userId"]);

  Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "title": title,
        "description": description,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "dueTime": dueTime,
        "isDone": isDone,
        "userId": userId,
      };
}
