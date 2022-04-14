import 'package:flutter/material.dart';
import 'package:meme_creator/styles/app_typography.dart';
import 'package:meme_creator/styles/colors.dart';
import 'package:meme_creator/styles/dimens.dart';

class RegisterTextField extends StatelessWidget {
  final String title;
  final String hint;
  final Widget error;
  final bool isSuffigsOn;

  const RegisterTextField(
      {Key? key,
      required this.title,
      required this.hint,
      required this.isSuffigsOn,
      required this.error})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimens.m),
            ),
            hintText: hint,
            hintStyle: AppTypography.body2
                .copyWith(color: MemeColors.textPlaceholderColor),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [error],
        )
      ],
    );
  }
}
