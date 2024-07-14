import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:math' as math;

import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';

class CustomDropdownDatetime extends StatefulWidget {
  const CustomDropdownDatetime({
    super.key,
    required this.onChange,
  });

  final void Function(DateTime) onChange;

  @override
  State<CustomDropdownDatetime> createState() => _CustomDropdownDatetimeState();
}

class _CustomDropdownDatetimeState extends State<CustomDropdownDatetime> {
  bool isOpen = false;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? value;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialButton(
          onPressed: () {
            setState(() {
              isOpen = !isOpen;
              _selectedDay = null;
              _focusedDay = DateTime.now();
            });
          },
          elevation: 0,
          color: AppColors.background,
          minWidth: double.infinity,
          height: 56.0,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
          shape: RoundedRectangleBorder(
              borderRadius: isOpen
                  ? const BorderRadius.vertical(top: Radius.circular(10.0))
                  : BorderRadius.circular(10.0),
              side: const BorderSide(color: AppColors.borderSecondary)),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fecha',
                    style: textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: AppDesign.padding / 2,
                  ),
                  Text(
                    value != null
                        ? DateFormat('d/MM/y').format(value!)
                        : 'dd/mm/yyyy',
                    style: textTheme.bodyLarge!.copyWith(
                        color: value != null
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
        if (isOpen)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.2),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.mutedForeground.withOpacity(.25),
                      blurRadius: 4.0,
                      offset: const Offset(-1.0, 2.0),
                    ),
                    BoxShadow(
                      color: AppColors.mutedForeground.withOpacity(.25),
                      blurRadius: 4.0,
                      offset: const Offset(1.0, 2.0),
                    )
                  ]),
              child: Column(
                children: [
                  TableCalendar(
                    locale: 'es_ES',
                    firstDay: DateTime.now(),
                    lastDay: DateTime(
                        2100, DateTime.now().month, DateTime.now().day),
                    focusedDay: value ?? _focusedDay,
                    selectedDayPredicate: (day) =>
                        isSameDay(value ?? _focusedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      if (selectedDay.isBefore(DateTime.now())) return;
                      if (!isSameDay(value, selectedDay)) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          value = selectedDay;
                        });
                      }
                    },
                    headerStyle: HeaderStyle(
                        headerPadding:
                            const EdgeInsets.symmetric(vertical: 12.0),
                        titleCentered: true,
                        formatButtonVisible: false,
                        titleTextStyle: textTheme.bodyLarge!,
                        titleTextFormatter: (date, locale) {
                          String title =
                              DateFormat('MMMM y', locale).format(date);

                          return title[0].toUpperCase() + title.substring(1);
                        },
                        leftChevronIcon: const Icon(
                          Icons.chevron_left,
                          color: AppColors.border,
                        ),
                        rightChevronIcon: const Icon(
                          Icons.chevron_right,
                          color: AppColors.border,
                        )),
                    availableGestures: AvailableGestures.all,
                    rowHeight: 38.0,
                    calendarStyle: const CalendarStyle(
                      cellPadding: EdgeInsets.all(4.0),
                    ),
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: (context, date) {
                        String d = DateFormat('E', 'es_ES').format(date)[0];

                        return Text(
                          d.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: textTheme.bodyMedium!
                              .copyWith(color: AppColors.mutedForeground),
                        );
                      },
                      defaultBuilder: (context, date, _) {
                        return Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 40.0,
                            height: 23.0,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: AppColors.foreground,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0))),
                            child: Text(
                              date.day > 10
                                  ? date.day.toString()
                                  : '0${date.day}',
                              style: textTheme.bodyMedium,
                            ),
                          ),
                        );
                      },
                      todayBuilder: (context, date, _) {
                        return Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 40.0,
                            height: 23.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: isSameDay(value, date)
                                    ? AppColors.secondary
                                    : value == null
                                        ? AppColors.secondary
                                        : AppColors.foreground,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(4.0))),
                            child: Text(
                              date.day > 10
                                  ? date.day.toString()
                                  : '0${date.day}',
                              style: textTheme.bodyMedium!.copyWith(
                                color: isSameDay(value, date)
                                    ? AppColors.muted
                                    : value == null
                                        ? AppColors.muted
                                        : AppColors.text,
                              ),
                            ),
                          ),
                        );
                      },
                      selectedBuilder: (context, date, _) {
                        return Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 40.0,
                            height: 23.0,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.0))),
                            child: Text(
                              date.day > 10
                                  ? date.day.toString()
                                  : '0${date.day}',
                              style: textTheme.bodyMedium!
                                  .copyWith(color: AppColors.muted),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _selectedDay = null;
                              _focusedDay = DateTime.now();

                              isOpen = false;
                            });
                          },
                          child: Text(
                            'Cancelar',
                            style: textTheme.headlineMedium!.copyWith(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400),
                          )),
                      const SizedBox(
                        width: 32.0,
                      ),
                      TextButton(
                          onPressed: () {
                            if (_selectedDay != null) {
                              widget.onChange(_selectedDay!);
                              value = _selectedDay;
                              setState(() {
                                isOpen = false;
                                _selectedDay = null;
                                _focusedDay = DateTime.now();
                              });
                            }
                          },
                          child: Text(
                            'Aplicar',
                            style: textTheme.headlineMedium!.copyWith(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                color: AppColors.secondary),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
          )
      ],
    );
  }
}
