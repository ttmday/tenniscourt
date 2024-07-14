import 'package:flutter/material.dart';
import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';

class IconBackButton extends StatelessWidget {
  const IconBackButton(
      {super.key, this.onPressed, this.canPopCb, this.showLabel = false});

  final void Function()? onPressed;
  final void Function()? canPopCb;
  final bool? showLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
        button: true,
        enabled: true,
        label: 'Boton de regreso',
        readOnly: true,
        tooltip: 'Volver atras',
        child: RepaintBoundary(
          child: IconButton(
              onPressed: () {
                if (onPressed != null) {
                  onPressed!();
                  return;
                }

                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                } else if (canPopCb != null) {
                  canPopCb!();
                }
              },
              style: IconButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.50)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDesign.padding)),
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.background,
              )),
        ));
  }
}
