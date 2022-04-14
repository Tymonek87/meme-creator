import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:meme_creator/data/api_routes.dart';
import 'package:meme_creator/data/auth/model/auth_dto.dart';

@injectable
class AuthApiDataSource {
  Future<AuthDto> signUp({
    required String email,
    required String password,
  }) async {
    final result = await http.post(
      Uri.parse(ApiRoutes.signUp),
      body: {'email': email, 'password': password},
    );
    

    final json = jsonDecode(result.body);
    return AuthDto(json['token']);
  }

    Future<AuthDto> signIn({
    required String email,
    required String password,
  }) async {
    final result = await http.post(
      Uri.parse(ApiRoutes.signIn),
      body: {'email': email, 'password': password},
    );
    

    final json = jsonDecode(result.body);
    return AuthDto(json['token']);
  }
}
