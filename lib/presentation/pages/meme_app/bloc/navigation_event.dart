part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class ShowRegistrationEvent extends NavigationEvent {
  @override
  List<Object?> get props => [];
}

class ShowSignInEvent extends NavigationEvent {
  @override
  List<Object?> get props => [];
}