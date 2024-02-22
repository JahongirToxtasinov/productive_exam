import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:productive_exam/features/tasks/presentation/widgets/task_item.dart';

import '../../../assets/constants/colors.dart';
import '../../../core/status/status.dart';
import 'bloc/tasks_bloc.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 16,),
                  TextField(
                    onChanged: (value) {
                      context.read<TasksBloc>().add(Searching(query: value));
                    },
                    cursorColor: cursorColor,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: textFieldBackgroundColor),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 44, vertical: 13.5),
                      prefixIcon: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Icon(Icons.search)
                      ),
                      suffixIcon: Container(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.filter)),
                      ),
                      filled: true,
                      fillColor: textFieldBackgroundColor,
                      hintText: 'Search by events, tasks.. ',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: allPageTextColor),
                    ),
                  ),

                  const SizedBox(height: 16,),


                ],
              ),
            ),
          ),
          body: BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              switch (state.status) {
                case LoadingStatus.pure:
                  context.read<TasksBloc>().add(LoadingTask());
                  return const SizedBox();
                case LoadingStatus.loading:
                  return const Center(child: CupertinoActivityIndicator());
                case LoadingStatus.loadedWithSuccess:
                  return state.isSearching
                      ? ListView.separated(
                    itemBuilder: (context, index) {
                      return TaskItem(
                        task: state.searchedTask[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Gap(16);
                    },
                    itemCount: state.searchedTask.length,
                  )
                      :
                      ListView.separated(
                        itemBuilder: (context, index) {
                          return TaskItem(
                            task: state.taskList[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Gap(16);
                        },
                        itemCount: state.taskList.length,
                      );

                default:
                  return const SizedBox();
              }
            },
          ),
        );
      }
    );
  }
}
