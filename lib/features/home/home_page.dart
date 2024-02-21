import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productive_exam/assets/constants/colors.dart';
import 'package:productive_exam/assets/constants/routes/route_1_tasks.dart';
import 'package:productive_exam/assets/constants/routes/route_2_expense.dart';
import 'package:productive_exam/assets/constants/routes/route_3_create.dart';
import 'package:productive_exam/assets/constants/routes/route_4_calendar.dart';
import 'package:productive_exam/assets/constants/routes/route_5_stats.dart';
import 'package:productive_exam/assets/constants/routes_name/app_routes.dart';
import 'package:productive_exam/features/home/widgets/tab_bar_item.dart';
import '../../../assets/constants/icons.dart';
import 'bloc/tab_bar_bloc.dart';
import 'destination.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController homePageController;

  var index = 1;

  @override
  void initState() {
    homePageController = PageController(keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('main route'),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TabBarBloc, TabBarState>(
              builder: (context, state) {
               return IndexedStack(
              index: state.activeIndex,
              children: const [
                DestinationPage(
                  onGenerateRoute: TasksRoute.onGenerateRoute,
                ),
                DestinationPage(
                  onGenerateRoute: ExpenseRoute.onGenerateRoute,
                ),
                DestinationPage(
                  onGenerateRoute: CreateRoute.onGenerateRoute,
                ),
                DestinationPage(
                  onGenerateRoute: CalendarRoute.onGenerateRoute,
                ),
                DestinationPage(
                  onGenerateRoute: StatsRoute.onGenerateRoute,
                ),
              ],
            );
  },
),
          ),
          Container(
            decoration: const BoxDecoration(
              color: navigationBarBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                [
                  TabBarItem(
                    index: 0,
                      icon: AppIcons.tasks,
                      title: "Tasks",
                      onTap: () {
                        print("worked 0");
                        index = 0;
                        context.read<TabBarBloc>().add(IsActiveColor(index: 0, isActive: true));
                      }),
                  TabBarItem(
                    index: 1,
                    icon: AppIcons.expense,
                    title: "Expense",
                    onTap: (){
                      print("worked 1");
                      index = 1;
                      context.read<TabBarBloc>().add(IsActiveColor(index: 1, isActive: true));
                      },
                  ),
                  TabBarItem(
                    index: 2,
                    icon: AppIcons.create,
                    title: "Create",
                    onTap: (){
                      print("worked 2");
                      index = 2;
                      context.read<TabBarBloc>().add(IsActiveColor(index: 2, isActive: true));
                      },
                  ),
                  TabBarItem(
                    index: 3,
                    icon: AppIcons.calendar,
                    title: "Calendar",
                    onTap: (){
                      index = 3;
                      print("worked 3");
                      context.read<TabBarBloc>().add(IsActiveColor(index: 3, isActive: true));
                      },
                  ),
                  TabBarItem(
                    index: 4,
                    icon: AppIcons.stats,
                    title: "Stats",
                    onTap: (){
                      index = 4;
                      print("worked 4");
                      context.read<TabBarBloc>().add(IsActiveColor(index: 4, isActive: false));
                    },
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    homePageController.dispose();
    super.dispose();
  }
}
