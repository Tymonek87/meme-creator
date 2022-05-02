import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationRegistrationState()) {
    on<ShowRegistrationEvent>((event, emit) {
      emit(NavigationRegistrationState());
    });
    on<ShowSignInEvent>((event, emit) {
      emit(NavigationSignInState());
    });
  }
}