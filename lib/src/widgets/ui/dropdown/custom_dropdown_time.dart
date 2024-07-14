import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';

class CustomDropdownTime extends StatefulWidget {
  const CustomDropdownTime(
      {super.key,
      required this.label,
      required this.onChange,
      this.greatherThan});

  final String label;
  final String? greatherThan;
  final void Function(String) onChange;

  @override
  State<CustomDropdownTime> createState() => _CustomDropdownTimeState();
}

class _CustomDropdownTimeState extends State<CustomDropdownTime> {
  final LayerLink _layerLink = LayerLink();
  bool isOpen = false;
  OverlayEntry? _entry;

  String value = '';

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return CompositedTransformTarget(
      link: _layerLink,
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
        color: AppColors.background,
        minWidth: double.infinity,
        height: 56.0,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: AppColors.borderSecondary)),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: AppDesign.padding / 2,
                ),
                Text(
                  value.isNotEmpty ? value : '00:00',
                  style: textTheme.bodyLarge!.copyWith(
                      color: value.isNotEmpty
                          ? AppColors.secondary
                          : AppColors.mutedForeground),
                )
              ],
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
    );
  }

  onShowOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    if (_entry != null) {
      _entry!.remove();
      _entry = null;
    }

    _entry = OverlayEntry(
        builder: (context) => Positioned(
              width: size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, size.height + 4),
                child: TimeWheel(
                  value: times.indexWhere(
                      (t) => t.compareTo(value.isEmpty ? '00:00' : value) == 0),
                  unAvailability: const ['10:00', '14:00'],
                  greaterThan: times.indexWhere(
                      (t) => t.compareTo(value.isEmpty ? '00:00' : value) == 0),
                  onChange: (val) {
                    if (val.compareTo(value) == 0) return;
                    setState(() {
                      value = val;
                    });
                    widget.onChange(val);
                  },
                ),
              ),
            ));

    overlay.insert(_entry!);

    setState(() {
      isOpen = true;
    });
  }

  onHideOverlay() {
    _entry?.remove();
    _entry = null;
  }
}

class TimeWheel extends StatefulWidget {
  const TimeWheel(
      {super.key,
      required this.value,
      required this.onChange,
      this.unAvailability = const [],
      required this.greaterThan});

  final int value;
  final List<String>? unAvailability;
  final int greaterThan;
  final void Function(String) onChange;

  @override
  State<TimeWheel> createState() => _TimeWheelState();
}

class _TimeWheelState extends State<TimeWheel> {
  late final FixedExtentScrollController _controller;
  int _selected = 0;

  @override
  void initState() {
    super.initState();

    _controller = FixedExtentScrollController(initialItem: widget.value);
    _selected = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size q = MediaQuery.of(context).size;
    return Container(
      height: 210.0,
      decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(5.0)),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 10,
            child: Center(
              child: Container(
                width: q.width,
                height: 40.0,
                decoration: const BoxDecoration(color: AppColors.foreground),
              ),
            ),
          ),
          ListWheelScrollView.useDelegate(
            controller: _controller,
            onSelectedItemChanged: (value) {
              if (widget.unAvailability?.contains(times[value]) == true) return;
              setState(() {
                _selected = value;
              });
              widget.onChange(times[_controller.selectedItem]);
            },
            itemExtent: 37.0,
            perspective: 0.002,
            diameterRatio: 1.7,
            squeeze: 1.1,
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
                childCount: times.length,
                builder: (context, index) {
                  String vl = times[index];
                  double opacity = 1.0;
                  int item = _selected;
                  bool isUnderline =
                      widget.unAvailability?.contains(vl) == true;
                  opacity =
                      (item - 1 == index || item + 1 == index) ? .67 : .32;

                  return Text(
                    vl,
                    style: textTheme.bodyLarge!.copyWith(
                      color: item == index && !isUnderline
                          ? AppColors.text
                          : AppColors.mutedForeground.withOpacity(opacity),
                      fontSize: item == index ? 17.0 : 14.0,
                      fontWeight: item == index && !isUnderline
                          ? FontWeight.w500
                          : FontWeight.w400,
                      decoration: isUnderline
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: item == index
                          ? AppColors.text
                          : AppColors.mutedForeground.withOpacity(opacity),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

final List<String> times = [
  '00:00',
  '01:00',
  '02:00',
  '03:00',
  '04:00',
  '05:00',
  '06:00',
  '07:00',
  '08:00',
  '09:00',
  '10:00',
  '11:00',
  '12:00',
  '13:00',
  '14:00',
  '15:00',
  '16:00',
  '17:00',
  '18:00',
  '19:00',
  '20:00',
  '21:00',
  '22:00',
  '23:00',
];
