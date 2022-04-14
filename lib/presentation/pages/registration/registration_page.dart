import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_creator/presentation/pages/registration/bloc/registration_bloc.dart';
import 'package:meme_creator/styles/app_typography.dart';
import 'package:meme_creator/styles/colors.dart';
import 'package:meme_creator/styles/dimens.dart';
import 'package:meme_creator/styles/images.dart';
import 'package:meme_creator/presentation/widgets/login_text.dart';
import 'package:meme_creator/presentation/widgets/email_field_widget.dart';
import 'package:meme_creator/presentation/widgets/meme_button.dart';
import 'package:meme_creator/presentation/widgets/password_field_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            Dimens.m, Dimens.zero, Dimens.m, Dimens.zero),
        child: SingleChildScrollView(
          child: BlocConsumer<RegistrationBloc, RegistrationState>(
            buildWhen: (previous, current) =>
                current is RegistrationInitialState ||
                current is RegistrationFormInvalidState ||
                current is RegistrationFormValidState,
            listenWhen: (previous, current) =>
                current is RegistrationLoadingState ||
                current is RegistrationErrorState ||
                current is RegistrationSuccessState,
            listener: (context, state) {
              if (state is RegistrationErrorState) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorText)));
              }

              if (state is RegistrationLoadingState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Submitting...')));
              }

              if (state is RegistrationSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registration success!')));
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
                        Images.helloEmot,
                        width: 52,
                        height: 52,
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimens.m),
                  Text(
                    'Nice to see you! Create an account first.',
                    style: AppTypography.h1.copyWith(
                      color: MemeColors.textPrimaryColor,
                    ),
                  ),
                  const SizedBox(height: Dimens.ms),
                  const EmailFieldWidget(),
                  // RegisterTextField(
                  //   isSuffigsOn: true,
                  //   title: 'Email',
                  //   hint: 'Create your password',
                  //   error: _buildEmailErrorText(state),
                  // ),
                  const SizedBox(height: Dimens.m),
                  const PasswordFieldWidget(),
                  // // RegisterTextField(
                  //   isSuffigsOn: true,
                  //   title: 'Password',
                  //   hint: 'Create your password',
                  //   error: _buildPasswordErrorText(state),
                  // ),
                  const SizedBox(height: Dimens.l),
                  MemeButton(
                      isActive: state is RegistrationFormValidState,
                      onTap: () {
                        context
                            .read<RegistrationBloc>()
                            .add(const RegistrationFormSubmittedEvent());
                      },
                      title: 'Create'),
                  const SizedBox(height: Dimens.m),
                  const LoginText(maintitle: 'Already have an account? ', subtitle: 'Log in',),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordErrorText(RegistrationState state) {
    if (state is RegistrationFormInvalidState) {
      return Text(
        state.passwordErrorText,
        style: AppTypography.caption.copyWith(color: MemeColors.systemColor),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}

Widget _buildEmailErrorText(RegistrationState state) {
  if (state is RegistrationFormInvalidState) {
    return Text(
      state.emailErrorText,
      style: AppTypography.caption.copyWith(color: MemeColors.systemColor),
    );
  } else {
    return const SizedBox.shrink();
  }
}
