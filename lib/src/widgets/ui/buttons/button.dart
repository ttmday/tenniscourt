import 'package:flutter/material.dart';

import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 53.0,
    this.width = 240.0,
    this.textStyle,
    this.variant = ButtonVariant.primary,
    this.asset,
    this.loading = false,
    this.textLoading,
    this.disabled = false,
  });

  final String title;
  final void Function() onPressed;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final ButtonVariant? variant;
  final String? asset;
  final bool? loading;
  final String? textLoading;
  final bool? disabled;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    TextStyle? style = textStyle ??
        textTheme.headlineLarge?.copyWith(color: AppColors.textSecondary);
    return Stack(
      children: [
        MaterialButton(
          onPressed: onPressed,
          elevation: 0,
          color: disabled == true
              ? variant!.color.withOpacity(.55)
              : variant!.color,
          minWidth: width,
          height: height,
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(AppDesign.radius - 12.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (asset != null)
                Padding(
                  padding: const EdgeInsets.only(right: 14.5),
                  child: Image.asset(
                    asset!,
                    width: 24.0,
                    color: variant!.textColor ?? AppColors.textSecondary,
                  ),
                ),
              Text(
                loading == true ? (textLoading ?? title) : title,
                style: style,
              ),
            ],
          ),
        ),
        if (loading == true)
          Positioned(
              right: 12.0,
              height: height,
              child: const Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.2,
                  ),
                ),
              ))
      ],
    );
  }
}

enum ButtonVariant {
  primary(
    color: Color(0xff84bc04),
    textColor: AppColors.textSecondary,
    disabledColor: Color.fromRGBO(130, 188, 0, .37),
  ),
  secondary(
    color: Color.fromRGBO(155, 156, 157, .5),
    textColor: AppColors.textSecondary,
    disabledColor: Color.fromRGBO(61, 61, 61, .3),
  );

  const ButtonVariant({
    required this.color,
    this.textColor = AppColors.textSecondary,
    this.disabledColor,
  });

  final Color color;
  final Color? textColor;
  final Color? disabledColor;
}
