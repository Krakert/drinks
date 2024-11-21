part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {
  final int tabIndex;

  const NavigationState({required this.tabIndex});
}

class NavigatorInitial extends NavigationState {
  const NavigatorInitial({required super.tabIndex});
}
