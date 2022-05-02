import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_creator/presentation/pages/login/login_page_builder.dart';
import 'package:meme_creator/presentation/pages/meme_app/bloc/navigation_bloc.dart';
import 'package:meme_creator/presentation/pages/registration/registration_page_builder.dart';

class MemeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<NavigationBloc, NavigationState>(
        builder: _builder,
      );

  Widget _builder(BuildContext context, NavigationState state) {
    if (state is NavigationRegistrationState) {
      return const RegistrationPageBuilder();
    } else if (state is NavigationSignInState) {
      return const LoginPageBuilder();
    } else {
      return const RegistrationPageBuilder();
    }
  }
}
