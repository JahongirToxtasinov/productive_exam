part of 'tasks_bloc.dart';

class TasksState {
  final LoadingStatus status;
  final List<TaskEntity> taskList;
  final List<TaskEntity> searchedTask;
  final String selectIcon;
  final bool isSearching;
  TasksState({
    required this.status,
    required this.taskList,
    required this.searchedTask,
    required this.isSearching,
    required this.selectIcon
  });


  TasksState copyWith({
    LoadingStatus? status,
    List<TaskEntity>? taskList,
    List<TaskEntity>? searchedTask,
    bool? isSearching,
    String? selectIcon,
  }) {
    return TasksState(
      status: status ?? this.status,
      selectIcon: selectIcon ?? this.selectIcon,
      taskList: taskList ?? this.taskList,
      searchedTask: searchedTask ?? this.searchedTask,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  String toString() {
    return '''
    TaskState
    status: $status, 
    selectIcon: $selectIcon
    taskList: $taskList, 
    isSearching: $isSearching ''';
  }

  @override
  bool operator ==(covariant TasksState other) {
    if (identical(this, other)) return true;

    return
      other.status == status &&
          listEquals(other.taskList, taskList) &&
          listEquals(other.searchedTask, searchedTask) &&
          other.isSearching == isSearching &&
          other.selectIcon == selectIcon;
  }

  @override
  int get hashCode {
    return status.hashCode ^
    taskList.hashCode ^
    searchedTask.hashCode ^
    isSearching.hashCode ^
    selectIcon.hashCode;
  }
}


