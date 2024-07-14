import 'package:flutter/material.dart';
import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';

class CheckboxWithLabel extends StatelessWidget {
  const CheckboxWithLabel(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.label,
      this.style});

  final bool value;
  final void Function(bool?) onChanged;
  final String label;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: AppColors.secondary,
            checkColor: AppColors.primary,
            side: const BorderSide(color: AppColors.mutedForeground, width: 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDesign.radius - 20),
                side: const BorderSide(color: AppColors.secondary)),
            value: value,
            onChanged: onChanged,
          ),
          const SizedBox(
            width: .5,
          ),
          Expanded(
            child: Text(
              label,
              style: style ??
                  Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 13.0),
            ),
          )
        ],
      ),
    );
  }
}
