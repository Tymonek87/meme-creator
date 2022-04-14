import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_creator/presentation/pages/login/bloc/login_bloc.dart';
import 'package:meme_creator/styles/app_typography.dart';
import 'package:meme_creator/styles/colors.dart';
import 'package:meme_creator/styles/dimens.dart';

class EmailFieldWidget extends StatefulWidget {
  const EmailFieldWidget({Key? key}) : super(key: key);

  @override
  State<EmailFieldWidget> createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget> {
  bool isEmailFilled = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Email',
                  style: AppTypography.caption
                      .copyWith(color: MemeColors.textPrimaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: Dimens.xs,
            ),
            TextFormField(
              onChanged: (email) {
                context
                    .read<LoginBloc>()
                    .add(LoginEmailChangedEvent(email));
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.m),
                ),
                hintText: 'Your mail',
                hintStyle: AppTypography.body2
                    .copyWith(color: MemeColors.textPlaceholderColor),
              ),
            ),
            const SizedBox(
              height: Dimens.xs,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_buildEmailErrorText(state)],
            ),
          ],
        );
      },
    );
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
