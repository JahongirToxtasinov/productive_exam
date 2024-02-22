import 'package:productive_exam/assets/constants/icons.dart';
import 'package:productive_exam/features/tasks/data/model/task_model.dart';
import 'package:productive_exam/features/tasks/domain/entity/task_entity.dart';

extension ModelToEntities on TaskModel {
  TaskEntity get toEntities {
    return TaskEntity(
      id: id!,
      title: title,
      description: description,
      icon: icon,
    );
  }
}

extension SelectIcon on String {

  String get selectIcon {
    if (this == 'gym') {
      return TaskIcons.gym;
    } else if (this == 'book') {
      return TaskIcons.book;
    } else if (this == 'meet') {
      return TaskIcons.meet;
    } else if (this == 'shop') {
      return TaskIcons.shop;
    } else {
      return TaskIcons.task;
    }

  }
}