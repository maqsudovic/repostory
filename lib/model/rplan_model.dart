class Replan {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  late final bool isCompleted;

  Replan({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  factory Replan.fromMap(Map<String, dynamic> map) {
    return Replan(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      dueDate: DateTime.parse(map['dueDate'] as String),
      isCompleted: map['isCompleted'] as bool,
    );
  }
}