class TaskEntity {
  final String id;
  final String title;
  final String description;
  final String icon;

  TaskEntity({
    required this.id,
    required this.title,
    required this.icon,
    required this.description,

  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          description == other.description &&
          icon == other.icon;


  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      icon.hashCode ;

  @override
  String toString() {
    return '''
    TaskEntity 
    id: $id, 
    title: $title, 
    description: $description, 
    icon: $icon, 
   ''';
  }

  TaskEntity copyWith({
     String? id,
     String? title,
     String? description,
     String? icon,

}) {
    return TaskEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        icon: icon ?? this.icon,
        description: description ?? this.description,

    );
  }

}