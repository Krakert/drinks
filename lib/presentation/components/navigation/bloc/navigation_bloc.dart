import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_state.dart';
part 'navigation_event.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const NavigatorInitial(tabIndex: 0)) {
    on<NavigationEvent>((event, emit) {
      if (event is TabChange) {
        emit(NavigatorInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
