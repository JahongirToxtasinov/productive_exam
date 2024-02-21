part of 'tab_bar_bloc.dart';

class TabBarState {
  final Color isActiveColor;
  final int activeIndex;
  TabBarState({required this.isActiveColor,required this.activeIndex});

  TabBarState copyWith({
    Color? isActiveColor,
    int? activeIndex,
  }) {
    return TabBarState(
      isActiveColor: isActiveColor ?? this.isActiveColor,
      activeIndex: activeIndex ?? this.activeIndex,
    );
  }

  @override
  String toString() {
    return 'TabBarState{isActiveColor: $isActiveColor} index $activeIndex';
  }

  @override
  bool operator ==(covariant TabBarState other) {
    if (identical(this, other)) return true;

    return
      other.isActiveColor == isActiveColor &&
      other.activeIndex == activeIndex;
  }

  @override
  int get hashCode {
    return isActiveColor.hashCode ^ activeIndex.hashCode;
  }
}

