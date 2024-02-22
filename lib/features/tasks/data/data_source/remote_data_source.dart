import 'package:productive_exam/core/exception/exception.dart';
import 'package:productive_exam/core/extension/extension.dart';
import 'package:productive_exam/features/tasks/domain/entity/task_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/task_model.dart';

abstract class TaskRemoteDataSource {
  Future<List<TaskEntity>> getTask();
  Future<bool> addTask(TaskModel taskModel);

  factory TaskRemoteDataSource() => _ToDoRemoteDataSource();
}

class _ToDoRemoteDataSource implements TaskRemoteDataSource{
  @override
  Future<List<TaskEntity>> getTask() async {
      final firebase = FirebaseFirestore.instance;
          final collection = await firebase.collection('todo').get();
          final task = collection.docs.map((e) => TaskModel.fromJson(e.data(),e.id)).toList();
          if (task.isNotEmpty) {
            return task.map((e) => e.toEntities).toList();
          }
          else {
      throw UnimplementedError();
    }
  }

  @override
  Future<bool> addTask(TaskModel taskModel) async {
    final firebase = FirebaseFirestore.instance;
      try {
       await firebase.collection('todo').add(
          taskModel.toJson(),
      );
      return true;
    } catch(e) {
        throw ServerException(
            errorMessage: "Cannot add task",
            errorCode: '666'
        );
      }
   }
}