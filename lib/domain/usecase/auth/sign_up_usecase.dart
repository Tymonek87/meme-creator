import 'package:injectable/injectable.dart';
import 'package:meme_creator/domain/auth/model/auth.dart';
import 'package:meme_creator/domain/auth/repository/auth_repository.dart';


@injectable
class SignUpUseCase {
  SignUpUseCase(this._authRepository);
  final AuthRepository _authRepository;

  Future<Auth> call(String email, String password) => _authRepository.signUp(
        email,
        password,
      );
}
