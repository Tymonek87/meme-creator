import 'package:flutter/material.dart';
import 'package:meme_creator/styles/app_typography.dart';
import 'package:meme_creator/styles/colors.dart';

class LoginText extends StatelessWidget {

  final String maintitle;
  final String subtitle;
  const LoginText({Key? key, required this.maintitle, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: maintitle,
                style: AppTypography.body2
                    .copyWith(color: MemeColors.textPrimaryColor),
              ),
              TextSpan(
                text: subtitle,
                style: AppTypography.body1
                    .copyWith(color: MemeColors.textPrimaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
