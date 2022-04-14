import 'package:injectable/injectable.dart';
import 'package:meme_creator/domain/auth/model/auth.dart';
import 'package:meme_creator/domain/auth/repository/auth_repository.dart';


@injectable
class SignInUseCase {
  SignInUseCase(this._authRepository);
  final AuthRepository _authRepository;

  Future<Auth> call(String email, String password) => _authRepository.signIn(
        email,
        password,
      );
}
