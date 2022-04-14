import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meme_creator/domain/usecase/auth/sign_up_usecase.dart';
part 'registration_event.dart';
part 'registration_state.dart';

@injectable
class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc(this._signUpUseCase) : super(RegistrationInitialState()) {
    on<RegistrationEmailChangedEvent>(
      (event, emit) {
        _email = event.email;
        _emailErrorText = _validateEmail(_email);

        _emitState(emit);
      },
    );

    on<RegistrationPasswordChangedEvent>(
      (event, emit) {
        _password = event.password;
        _passwordErrorText = _validatePassword(_password);

        _emitState(emit);
      },
    );
    on<RegistrationFormSubmittedEvent>(((event, emit) async {
      await _submitForm(emit: emit);
    }));
  }

  Future<void> _submitForm({required Emitter emit}) async {
    try {
      emit(RegistrationLoadingState());

      final response = await _signUpUseCase(_email, _password);
      print("Elo mordzo t, to tWój token: ${response.token}");

      // if (response.statusCode == 200) {
      //   emit(const RegistrationSuccessState());
      // } else {
      //   emit(const RegistrationErrorState('Something wrong with form!'));
      // }
    } catch (error) {
      emit(const RegistrationErrorState('Registration failed!'));
    }
  }

  final SignUpUseCase _signUpUseCase;

  String _password = '';
  String? _passwordErrorText;
  String _email = '';
  String? _emailErrorText;

  String _validateEmail(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.contains('@')) {
        return '';
      } else {
        return 'Mail should include @';
      }
    } else {
      return 'Email should not be empty';
    }
  }

  String _validatePassword(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.length >= 8) {
        return '';
      } else {
        return 'At least 8 characters needed.';
      }
    } else {
      return 'Password should not be empty';
    }
  }

  void _emitState(Emitter emit) {
    if (_emailErrorText?.isEmpty == true &&
        _passwordErrorText?.isEmpty == true) {
      emit(
        RegistrationFormValidState(),
      );
    } else {
      emit(
        RegistrationFormInvalidState(
          _emailErrorText ?? '',
          _passwordErrorText ?? '',
        ),
      );
    }
  }
}
