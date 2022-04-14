import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_creator/presentation/pages/login/bloc/login_bloc.dart';
import 'package:meme_creator/styles/app_typography.dart';
import 'package:meme_creator/styles/colors.dart';
import 'package:meme_creator/styles/dimens.dart';
import 'package:meme_creator/styles/images.dart';

class PasswordFieldWidget extends StatefulWidget {
  // final ValueChanged<String?> onchanged;

  const PasswordFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _isObsqured = true;
  bool isPasswordFilled = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text('Password'),
              ],
            ),
            const SizedBox(
              height: Dimens.xs,
            ),
            TextFormField(
              obscureText: _isObsqured,
              validator: (value) {
                if (value != null) {
                  isPasswordFilled = true;
                } else {
                  isPasswordFilled = false;
                }
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimens.m),
                ),
                hintText: 'Create your password',
                hintStyle: AppTypography.body2
                    .copyWith(color: MemeColors.textPlaceholderColor),
                suffixIcon: IconButton(
                  icon: (_isObsqured
                      ? Image.asset(
                          Images.eyeon,
                        )
                      : Image.asset(
                          Images.eyeoff,
                        )),
                  onPressed: () => setState(
                    () {
                      _isObsqured ? _isObsqured = false : _isObsqured = true;
                    },
                  ),
                ),
              ),
              onChanged: (password) {
                context
                    .read<LoginBloc>()
                    .add(LoginPasswordChangedEvent(password));
              },
            ),
            const SizedBox(
              height: Dimens.xs,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_buildPasswordErrorText(state)],
            )
          ],
        );
      },
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
