import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:productive_exam/core/widgets/w_button.dart';
import 'package:productive_exam/features/create/presentation/widgets/text_field.dart';
import 'package:productive_exam/features/tasks/data/model/task_model.dart';
import 'package:productive_exam/features/tasks/domain/usecase/task_usecase.dart';

import '../../../assets/constants/colors.dart';
import '../../tasks/presentation/bloc/tasks_bloc.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController iconController = TextEditingController();

  @override
  void initState() {
    titleController = TextEditingController();
    descController = TextEditingController();
    iconController = TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(24),
          InTextField(
              icon: const Icon(Icons.title),
              hintText: "Add Title",
              controller: titleController
          ),
          InTextField(
              icon: const Icon(Icons.description_outlined),
              hintText: "Add Description",
              controller: descController
          ),
          InTextField(
              icon: const Icon(Icons.widgets),
              hintText: "IconName",
              controller: iconController
          ),
          const Gap(14),
          Align(alignment: Alignment.center,
            child: WButton(
              child: Text("Create Task"),
              width: 200,
                onTap: (){
              if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
              context.read<TasksBloc>().add(CreateNewTaskPressed(
                    title: titleController.text,
                    icon: iconController.text,
                    description: descController.text,
                    onSuccess: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Successfully created'),
                        ),
                      );
                      context.read<TasksBloc>().add(LoadingTask());
                      titleController.clear();
                      descController.clear();
                      iconController.clear();
                    },
                    onFailure: (String error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Creating failed"),
                        ),
                      );
                    },
                  ));
            } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Title and Description are required!'),
                  ),
                );
              }
                    }),
          ),
        ],
      )
    );
  }
  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }
}
