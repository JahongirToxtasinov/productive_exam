import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:productive_exam/core/status/status.dart';
import 'package:productive_exam/features/tasks/data/data_source/remote_data_source.dart';
import 'package:productive_exam/features/tasks/data/model/task_model.dart';
import 'package:productive_exam/features/tasks/data/repository/repo.dart';
import 'package:productive_exam/features/tasks/domain/entity/task_entity.dart';
import 'package:productive_exam/features/tasks/domain/usecase/task_usecase.dart';

import '../../../../assets/constants/icons.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc()
      :
        super(TasksState(
          searchedTask: [],
          isSearching: false,
          taskList: [],
          status: LoadingStatus.pure,
          selectIcon: '')) {
    on<LoadingTask>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
       final usecase = GetTaskUsecase(taskRepository: TaskRepositoryImpl(taskRemoteDataSource: TaskRemoteDataSource()));
       final either = await usecase.call(GetTask());
       either.either((failure) {
         emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
       }, (value) {
         emit(state.copyWith(status: LoadingStatus.loadedWithSuccess, taskList: value));
       });
    });
    on<SelectIconPressed>((event, emit) {
      switch (event.index) {
        case 0:
          emit(
            state.copyWith(
                selectIcon: AppIcons.create,),
          );
        case 1:
          emit(
            state.copyWith(
                selectIcon: AppIcons.calendar,),
          );
        default:
          emit(
            state.copyWith(
                selectIcon: AppIcons.expense,),
          );
      }
    });
    on<CreateNewTaskPressed>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));
      final newTask = AddTaskUsecase(taskRepository: TaskRepositoryImpl(taskRemoteDataSource: TaskRemoteDataSource()));
      final either = await newTask.call(AddTask(
          taskModel: TaskModel(
            title: event.title,
            icon: event.icon,
            description: event.description
          )));

      either.either((failure) {
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
        event.onFailure(String as String);
      }, (value) {
        emit(state.copyWith(status: LoadingStatus.loadedWithSuccess));
        event.onSuccess();
      });

    });

    on<Searching>((event, emit) {
      if (event.query.isEmpty) {
        emit(state.copyWith(isSearching: false));
      } else {
        final newList = state.taskList
            .where((element) => element.title.contains(event.query))
            .toList();
        emit(state.copyWith(searchedTask: newList, isSearching: true));
      }
    });
  }
}
