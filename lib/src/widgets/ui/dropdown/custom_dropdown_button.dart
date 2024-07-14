import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'dart:math' as math;

import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';

class CustomDropdownButtonItem extends Equatable {
  final String value;
  final String label;

  const CustomDropdownButtonItem({required this.value, required this.label});

  @override
  List<Object> get props => [value, label];
}

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton(
      {super.key,
      required this.hintText,
      required this.items,
      required this.onChange,
      this.decoration,
      this.height,
      this.width,
      this.padding,
      this.defaultValue});

  final String hintText;
  final List<CustomDropdownButtonItem> items;
  final double? width;
  final double? height;
  final void Function(dynamic value) onChange;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  final String? defaultValue;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String value = '';
  bool isOpen = false;
  OverlayEntry? entry;
  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();

    if (widget.defaultValue != null) {
      value = widget.defaultValue!;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return CompositedTransformTarget(
      link: _layerLink,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: widget.width ?? double.infinity),
        child: MaterialButton(
          onPressed: () {
            if (isOpen) {
              onHideOverlay();
              setState(() {
                isOpen = false;
              });
              return;
            }
            onShowOverlay();
          },
          elevation: 0,
          minWidth: double.minPositive,
          height: widget.height,
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0, vertical: AppDesign.padding - 2),
          shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: AppColors.border,
              ),
              borderRadius: BorderRadius.circular(AppDesign.radius - 14.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                value.isNotEmpty ? value : widget.hintText,
                style: textTheme.bodyMedium!.copyWith(fontFamily: 'Poppins'),
              )),
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 320),
                tween: Tween(begin: 0.0, end: isOpen ? 180.0 : 0.0),
                builder: (context, value, child) {
                  return Transform.rotate(
                    angle: value * -(math.pi) / 180,
                    child: child,
                  );
                },
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 20.0,
                  color: AppColors.border,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onShowOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    if (entry != null) {
      entry!.remove();
      entry = null;
    }

    entry = OverlayEntry(
        builder: (context) => Positioned(
              width: widget.width ?? size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 4),
                child: TapRegion(
                  behavior: HitTestBehavior.deferToChild,
                  consumeOutsideTaps: true,
                  onTapOutside: (event) {
                    if (isOpen) {
                      onHideOverlay();
                      setState(() {
                        isOpen = false;
                      });
                      return;
                    }
                  },
                  child: OverlayContent(
                    items: widget.items,
                    width: widget.width,
                    decoration: widget.decoration,
                    onPressed: (val) {
                      widget.onChange(val);
                      setState(() {
                        value = val;
                        isOpen = false;
                      });
                      onHideOverlay();
                    },
                  ),
                ),
              ),
            ));

    overlay.insert(entry!);

    setState(() {
      isOpen = true;
    });
  }

  onHideOverlay() {
    entry?.remove();
    entry = null;
  }
}

class OverlayContent extends StatelessWidget {
  const OverlayContent({
    super.key,
    required this.items,
    required this.onPressed,
    this.width,
    this.decoration,
  });

  final List<CustomDropdownButtonItem> items;
  final void Function(String value) onPressed;
  final double? width;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
        width: width,
        decoration: decoration ??
            BoxDecoration(
                color: AppColors.background,
                border: Border.all(
                  color: AppColors.border,
                ),
                borderRadius: BorderRadius.circular(AppDesign.radius - 14.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(items.length, (index) {
            final item = items[index];

            return GestureDetector(
                onTap: () => onPressed(item.value),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 14.0),
                    child: Text(
                      item.label,
                      style:
                          textTheme.bodyMedium!.copyWith(fontFamily: 'Poppins'),
                    )));
          }),
        ));
  }
}
