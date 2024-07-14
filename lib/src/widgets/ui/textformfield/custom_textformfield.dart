import 'package:flutter/material.dart';
import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key,
      required this.label,
      required this.controller,
      required this.icon,
      this.suffixIcon,
      this.type = TextInputType.text,
      this.obscureText = false});

  final String label;
  final TextEditingController controller;
  final String icon;
  final String? suffixIcon;
  final bool? obscureText;
  final TextInputType? type;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode focusNode = FocusNode();
  bool isFocused = false;
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(onTextController);

    focusNode.addListener(onFocusListener);
  }

  @override
  void dispose() {
    focusNode.removeListener(onFocusListener);
    focusNode.dispose();

    widget.controller.removeListener(onTextController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 53.0,
      alignment: Alignment.bottomLeft,
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.mutedForeground))),
      padding: const EdgeInsets.symmetric(
          horizontal: AppDesign.padding + 4, vertical: AppDesign.padding),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      widget.icon,
                    ),
                    const VerticalDivider(
                      width: 18.0,
                      indent: 16.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  focusNode: focusNode,
                  keyboardType: widget.type,
                  obscureText: widget.obscureText ?? false,
                  decoration: InputDecoration(
                      hintText: widget.label,
                      hintStyle:
                          textTheme.bodyLarge!.copyWith(fontFamily: 'Poppins'),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      constraints: const BoxConstraints(maxHeight: 20.0)),
                  onTapOutside: (_) {
                    focusNode.unfocus();
                  },
                ),
              ),
              if (widget.suffixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Image.asset(
                    widget.suffixIcon!,
                  ),
                )
            ],
          ),
          if (isFocused || !isEmpty)
            Positioned(
              top: -8.0,
              left: 0,
              child: Text(
                widget.label,
                style: textTheme.bodyMedium!.copyWith(
                    fontFamily: 'Poppins', color: AppColors.mutedForeground),
              ),
            )
        ],
      ),
    );
  }

  onFocusListener() {
    if (isFocused == focusNode.hasFocus) return;

    setState(() {
      isFocused = focusNode.hasFocus;
    });
  }

  onTextController() {
    if (widget.controller.text.isNotEmpty) {
      if (!isEmpty) return;
      setState(() {
        isEmpty = false;
      });

      return;
    }

    if (isEmpty) return;

    setState(() {
      isEmpty = true;
    });
  }
}
