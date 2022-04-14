import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_creator/presentation/pages/login/bloc/login_bloc.dart';
import 'package:meme_creator/presentation/widgets/email_login_field_widget.dart';
import 'package:meme_creator/presentation/widgets/password_login_field_widget.dart';

import 'package:meme_creator/styles/app_typography.dart';
import 'package:meme_creator/styles/colors.dart';
import 'package:meme_creator/styles/dimens.dart';
import 'package:meme_creator/styles/images.dart';
import 'package:meme_creator/presentation/widgets/login_text.dart';
import 'package:meme_creator/presentation/widgets/meme_button.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            Dimens.m, Dimens.zero, Dimens.m, Dimens.zero),
        child: SingleChildScrollView(
          child: BlocConsumer<LoginBloc, LoginState>(
            buildWhen: (previous, current) =>
                current is LoginInitialState ||
                current is LoginFormInvalidState ||
                current is LoginFormValidState,
            listenWhen: (previous, current) =>
                current is LoginLoadingState ||
                current is LoginErrorState ||
                current is LoginSuccessState,
            listener: (context, state) {
              if (state is LoginErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorText)));
              }

              if (state is LoginLoadingState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Submitting...')));
              }

              if (state is LoginSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login success!')));
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: Dimens.xxxxl),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Images.loginEmot,
                        width: 52,
                        height: 52,
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimens.m),
                  Text(
                    'Welcome back! Log in to generate memes.',
                    style: AppTypography.h1.copyWith(
                      color: MemeColors.textPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: Dimens.ms),
                  const EmailFieldWidget(),
                
                  const SizedBox(height: Dimens.m),
                  const PasswordFieldWidget(),
                 
                  const SizedBox(height: Dimens.l),
                  MemeButton(
                      isActive: state is LoginFormValidState,
                      onTap: () {
                        context
                            .read<LoginBloc>()
                            .add(const LoginFormSubmittedEvent());
                      },
                      title: 'Log in'),
                  const SizedBox(height: Dimens.m),
                  const LoginText(maintitle: 'Don’t have an account? ', subtitle: "Sign in",),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordErrorText(LoginState state) {
    if (state is LoginFormInvalidState) {
      return Text(
        state.passwordErrorText,
        style: AppTypography.caption.copyWith(color: MemeColors.systemColor),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

Widget _buildEmailErrorText(LoginState state) {
  if (state is LoginFormInvalidState) {
    return Text(
      state.emailErrorText,
      style: AppTypography.caption.copyWith(color: MemeColors.systemColor),
    );
  } else {
    return const SizedBox.shrink();
  }
}
