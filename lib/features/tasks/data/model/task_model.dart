
class TaskModel  {
  final String? id;
  final String title;
  final String description;
  final String icon;

  TaskModel({
     this.id,
    required this.title,
    required this.icon,
    required this.description,

  });

  factory TaskModel.fromJson(Map<String, dynamic> json, String id) {
    return TaskModel(
      id: id,
      title: json['title'] ?? '',
      icon: json['icon'] ?? '',
      description: json['description'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'icon': icon,
      'description': description,
    };
  }
}
