import 'package:flutter/material.dart';
import 'package:meme_creator/styles/app_typography.dart';
import 'package:meme_creator/styles/colors.dart';
import 'package:meme_creator/styles/dimens.dart';

class MemeButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isActive;

  const MemeButton({
    required this.title,
    required this.onTap,
    this.isActive = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.m),
            ),
          ),
          backgroundColor: isActive
              ? MaterialStateProperty.all<Color>(MemeColors.mainColorDark)
              : MaterialStateProperty.all<Color>(MemeColors.grey),
        ),
        onPressed: () {
          if (isActive) {
            onTap();
          }
        },
        child: Text(
          title,
          style: AppTypography.body1.copyWith(
              color:
                  isActive ? MemeColors.white : MemeColors.TextDisabledColor),
        ),
      ),
    );
  }
}
