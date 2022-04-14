import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_creator/injectable/injectable.dart';
import 'package:meme_creator/presentation/pages/registration/bloc/registration_bloc.dart';
import 'package:meme_creator/presentation/pages/registration/registration_page.dart';

class RegistrationPageBuilder extends StatelessWidget {
  const RegistrationPageBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<RegistrationBloc>(
        create: (context) => getIt<RegistrationBloc>(),
        child: const RegisterPage(),
      );
}
