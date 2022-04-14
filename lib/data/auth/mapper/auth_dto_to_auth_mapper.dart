import 'package:injectable/injectable.dart';
import 'package:meme_creator/data/auth/model/auth_dto.dart';
import 'package:meme_creator/domain/auth/model/auth.dart';

@injectable
class AuthDtoToAuthMapper {
  Auth call(AuthDto dto) => Auth(dto.token);
}
