import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_creator/injectable/injectable.dart';
import 'package:meme_creator/presentation/pages/login/bloc/login_bloc.dart';
import 'package:meme_creator/presentation/pages/login/login_page%20.dart';


class LoginPageBuilder extends StatelessWidget {
  const LoginPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<LoginBloc>(
        create: (context) => getIt<LoginBloc>(),
        child: const LoginPage(),
      );
}
