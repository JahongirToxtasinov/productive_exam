import 'package:productive_exam/core/either/either.dart';
import 'package:productive_exam/core/failure/failure.dart';
import 'package:productive_exam/core/usecase/usecase.dart';
import 'package:productive_exam/features/tasks/data/model/task_model.dart';
import 'package:productive_exam/features/tasks/domain/entity/task_entity.dart';
import 'package:productive_exam/features/tasks/domain/repository/task_repo_domain.dart';

class GetTaskUsecase implements UseCase<List<TaskEntity>, NoParams>{
  final TaskRepository _taskRepository;

  GetTaskUsecase({required TaskRepository taskRepository}) : _taskRepository = taskRepository;
  @override
  Future<Either<Failure, List<TaskEntity>>> call(param) async {
    if (param is GetTask) {
      return await _taskRepository.getTask();
    }
    throw UnimplementedError();
  }

}
class GetTask extends NoParams {}

class AddTask extends NoParams {
  final TaskModel taskModel;

  AddTask({required this.taskModel});
}

class AddTaskUsecase implements UseCase<bool , NoParams> {
  final TaskRepository _taskRepository;

  AddTaskUsecase({required TaskRepository taskRepository}) : _taskRepository = taskRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams param) async {
    if (param is AddTask) {
      return await _taskRepository.addTask(param.taskModel);
    }
    throw UnimplementedError();
  }}