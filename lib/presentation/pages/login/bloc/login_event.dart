part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEmailChangedEvent extends LoginEvent {
  const LoginEmailChangedEvent(this.email);

  final String email;

  @override
  List<Object?> get props => [
        email,
      ];
}

class LoginPasswordChangedEvent extends LoginEvent {
  const LoginPasswordChangedEvent(this.password);
  final String password;

  @override
  List<Object?> get props => [password];
}

class LoginFormSubmittedEvent extends LoginEvent {
  const LoginFormSubmittedEvent();

  @override
  List<Object?> get props => [];
}
