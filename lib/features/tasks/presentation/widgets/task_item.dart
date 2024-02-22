import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:productive_exam/core/extension/extension.dart';
import 'package:productive_exam/features/tasks/domain/entity/task_entity.dart';

class TaskItem extends StatelessWidget {
  final TaskEntity task;
  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.blue,width: 2)
      ),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(task.icon.selectIcon,width: 52,height: 52),
              const Gap(30),
              Text(task.title,style: const TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
            ],
          ),
          Row(
            children: [
              Text(task.description,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 12),maxLines: 5),
            ],
          )
        ],
      ),
    );
  }
}
