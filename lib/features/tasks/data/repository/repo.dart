import 'package:productive_exam/core/either/either.dart';
import 'package:productive_exam/core/failure/failure.dart';
import 'package:productive_exam/features/tasks/data/model/task_model.dart';
import 'package:productive_exam/features/tasks/domain/entity/task_entity.dart';
import 'package:productive_exam/features/tasks/domain/repository/task_repo_domain.dart';

import '../data_source/remote_data_source.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource _taskRemoteDataSource;

  TaskRepositoryImpl({required TaskRemoteDataSource taskRemoteDataSource}) : _taskRemoteDataSource = taskRemoteDataSource;
  @override
  Future<Either<Failure, List<TaskEntity>>> getTask() async {
    try {
      final result = await _taskRemoteDataSource.getTask();
      return Right(result);
    } catch(error) {
      return Left(const ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> addTask(TaskModel taskModel) async {
    try {
      final result = await _taskRemoteDataSource.addTask(taskModel);
      return Right(result);
    } catch(error) {
      return Left(const ServerFailure());
    }
  }
}