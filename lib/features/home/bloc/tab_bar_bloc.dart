import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../assets/constants/colors.dart';

part 'tab_bar_event.dart';
part 'tab_bar_state.dart';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  TabBarBloc() : super(TabBarState(isActiveColor: activeColor, activeIndex: 0)) {
    on<IsActiveColor>((event, emit) {
      emit(state.copyWith(activeIndex: event.index, isActiveColor: activeColor));
    });
  }
}


