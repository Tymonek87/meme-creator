part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitialState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFormValidState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginFormInvalidState extends LoginState {
  const LoginFormInvalidState(
      this.emailErrorText, this.passwordErrorText);

  final String emailErrorText;
  final String passwordErrorText;

  @override
  List<Object?> get props => [emailErrorText, passwordErrorText];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState();

  @override
  List<Object?> get props => [];
}

class LoginErrorState extends LoginState {
  final String errorText;

  const LoginErrorState(this.errorText);

  @override
  List<Object?> get props => [errorText];
}
