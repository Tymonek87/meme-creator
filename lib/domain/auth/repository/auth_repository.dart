import 'package:meme_creator/domain/auth/model/auth.dart';

abstract class AuthRepository {
  Future<Auth> signIn(String email, String password);
  Future<Auth> signUp(String email, String password);
}
