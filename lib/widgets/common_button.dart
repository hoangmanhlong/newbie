import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/app_res.dart';

class CommonButton extends StatelessWidget {
  final String label;
  final int buttonColor;
  final bool hasIcon;
  final String? iconRes;
  final Function()? onButtonClicked;

  const CommonButton(
      {super.key,
      required this.label,
      required this.buttonColor,
      required this.hasIcon,
      this.onButtonClicked,
      this.iconRes});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonClicked,
      child: SizedBox(
        height: 70,
        child: Card(
          color: Color(buttonColor),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (hasIcon && iconRes != null && iconRes!.isNotEmpty) ...[
                SvgPicture.asset(
                  width: 24,
                  height: 24,
                  AppRes.getImageResPath(iconRes!),
                ),
                const SizedBox(width: 40),
              ],
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
