import 'package:productive_exam/features/tasks/data/model/task_model.dart';
import 'package:productive_exam/features/tasks/domain/entity/task_entity.dart';

import '../../../../core/either/either.dart';
import '../../../../core/failure/failure.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TaskEntity>>> getTask();
  Future<Either<Failure,bool>> addTask(TaskModel taskModel);
}