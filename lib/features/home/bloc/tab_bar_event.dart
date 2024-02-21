part of 'tab_bar_bloc.dart';

@immutable
sealed class TabBarEvent {}

class IsActiveColor extends TabBarEvent {
  final int index;
  final bool isActive;

  IsActiveColor({
    required this.index,
    required this.isActive,
  });
}