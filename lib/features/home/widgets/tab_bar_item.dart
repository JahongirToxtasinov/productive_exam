import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../bloc/tab_bar_bloc.dart';

class TabBarItem extends StatelessWidget {
  final int index;
  final String icon;
  final String title;
  final Function() onTap;

  const TabBarItem({
    Key? key,
    required this.index,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BlocBuilder<TabBarBloc, TabBarState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                color: index == state.activeIndex ? state.isActiveColor : null,
              ),
              const Gap(4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: index == state.activeIndex ? state.isActiveColor : Colors.white,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
