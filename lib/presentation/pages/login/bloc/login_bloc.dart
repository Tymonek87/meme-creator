import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meme_creator/domain/usecase/auth/sign_in_usecase.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._signInUseCase) : super(LoginInitialState()) {
    on<LoginEmailChangedEvent>(
      (event, emit) {
        _email = event.email;
        _emailErrorText = _validateEmail(_email);

        _emitState(emit);
      },
    );

    on<LoginPasswordChangedEvent>(
      (event, emit) {
        _password = event.password;
        _passwordErrorText = _validatePassword(_password);

        _emitState(emit);
      },
    );
    on<LoginFormSubmittedEvent>(((event, emit) async {
      await _submitForm(emit: emit);
    }));
  }

  Future<void> _submitForm({required Emitter emit}) async {
    try {
      emit(LoginLoadingState());

      final response = await _signInUseCase(_email, _password);
      print("Elo sie zalogowałeś");

    
    } catch (error) {
      emit(const LoginErrorState('Login failed!'));
    }
  }

  final SignInUseCase _signInUseCase;

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
        LoginFormValidState(),
      );
    } else {
      emit(
        LoginFormInvalidState(
          _emailErrorText ?? '',
          _passwordErrorText ?? '',
        ),
      );
    }
  }
}
