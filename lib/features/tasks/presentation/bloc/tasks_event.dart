part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

class LoadingTask extends TasksEvent {}

class CheckedTask extends TasksEvent {
  final int index;
  CheckedTask({
    required this.index,
  });
}

class CreateNewTaskPressed extends TasksEvent {

  final String title;
  final String description;
  final String icon;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;

  CreateNewTaskPressed({
    required this.title,
    required this.icon,
    required this.description,
    required this.onSuccess,
    required this.onFailure,
  });

  CreateNewTaskPressed copyWith({
    String? title,
    String? icon,
    String? description,
    VoidCallback? onSuccess,
    ValueChanged<String>? onFailure,
  }) {
    return CreateNewTaskPressed(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      description: description ?? this.description,
      onSuccess: onSuccess ?? this.onSuccess,
      onFailure: onFailure ?? this.onFailure,
    );
  }

  @override
  bool operator ==(covariant CreateNewTaskPressed other) {
    if (identical(this, other)) return true;

    return
      other.title == title &&
          other.icon == icon &&
          other.description == description &&
          other.onSuccess == onSuccess &&
          other.onFailure == onFailure;
  }

  @override
  int get hashCode {
    return
      title.hashCode ^
      icon.hashCode ^
      description.hashCode ^
      onSuccess.hashCode ^
      onFailure.hashCode;
  }

  @override
  String toString() {
    return '''
    CreateNewTaskPressed
    title: $title, 
    icon: $icon, 
    description: $description, 
    onSuccess: $onSuccess, 
    onFailure: $onFailure''';
  }
}


class SelectIconPressed extends TasksEvent {
  final int index;
  SelectIconPressed({
    required this.index,
  });
}

class Searching extends TasksEvent {
  final String query;
  Searching({
    required this.query,
  });

}
