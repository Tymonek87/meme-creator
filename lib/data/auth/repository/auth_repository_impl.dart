import 'package:injectable/injectable.dart';
import 'package:meme_creator/data/auth/data_sources/register_api_data_source.dart';
import 'package:meme_creator/data/auth/mapper/auth_dto_to_auth_mapper.dart';
import 'package:meme_creator/domain/auth/model/auth.dart';
import 'package:meme_creator/domain/auth/repository/auth_repository.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._authDataSource, this._authDtoToAuthMapper);

  final AuthApiDataSource _authDataSource;
  final AuthDtoToAuthMapper _authDtoToAuthMapper;

  @override
  Future<Auth> signUp(String email, String password) async {
    final authDto =
        await _authDataSource.signUp(email: email, password: password);
    return _authDtoToAuthMapper(authDto);
  }
 @override
  Future<Auth> signIn(String email, String password) async {
    final authDto =
        await _authDataSource.signIn(email: email, password: password);
    return _authDtoToAuthMapper(authDto);
  }
}
