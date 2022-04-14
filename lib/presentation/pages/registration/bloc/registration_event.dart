part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}

class RegistrationEmailChangedEvent extends RegistrationEvent {
  const RegistrationEmailChangedEvent(this.email);

  final String email;

  @override
  List<Object?> get props => [
        email,
      ];
}

class RegistrationPasswordChangedEvent extends RegistrationEvent {
  const RegistrationPasswordChangedEvent(this.password);
  final String password;

  @override
  List<Object?> get props => [password];
}

class RegistrationFormSubmittedEvent extends RegistrationEvent {
  const RegistrationFormSubmittedEvent();

  @override
  List<Object?> get props => [];
}
