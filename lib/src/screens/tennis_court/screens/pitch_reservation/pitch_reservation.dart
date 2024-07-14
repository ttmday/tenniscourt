import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenniscourt/src/constants/color.dart';
import 'package:tenniscourt/src/constants/design.dart';

import 'package:tenniscourt/src/models/court.dart';

import 'package:tenniscourt/src/constants/images_assets.dart';
import 'package:tenniscourt/src/models/reservation.dart';
import 'package:tenniscourt/src/providers/reservations.dart';
import 'package:tenniscourt/src/screens/tennis_court/screens/pitch_reservation/bloc/reservation_bloc.dart';
import 'package:tenniscourt/src/screens/tennis_court/screens/pitch_reservation/pitch_reservation_pay.dart';

import 'package:tenniscourt/src/screens/tennis_court/screens/pitch_reservation/widgets/court_info.dart';
import 'package:tenniscourt/src/widgets/ui/buttons/button.dart';
import 'package:tenniscourt/src/widgets/ui/buttons/icon_back_button.dart';
import 'package:tenniscourt/src/widgets/ui/dropdown/custom_dropdown_button.dart';
import 'package:tenniscourt/src/widgets/ui/dropdown/custom_dropdown_datetime.dart';
import 'package:tenniscourt/src/widgets/ui/dropdown/custom_dropdown_time.dart';

class PitchReservationScreen extends StatefulWidget {
  const PitchReservationScreen({super.key, required this.court});

  final CourtModel court;

  @override
  State<PitchReservationScreen> createState() => _PitchReservationScreenState();
}

class _PitchReservationScreenState extends State<PitchReservationScreen> {
  late final ReservationBloC _bloC;

  final TextEditingController _commentController = TextEditingController();

  String instructor = '';
  DateTime? dateTime;
  String startTime = '00:00';
  String endTime = '00:00';

  @override
  void initState() {
    super.initState();

    _bloC = ReservationBloC(ReservationModel(
        court: widget.court,
        comment: '',
        dateTime: DateTime.now(),
        howManyHours: 0,
        instructor: '',
        priceToPay: '',
        reservedBy:
            const ReservedBy(name: 'Andrea Gómez', avatar: iconAvatarAsset),
        time: ''));
  }

  @override
  void dispose() {
    _commentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size q = MediaQuery.sizeOf(context);
    double insetsBottom = MediaQuery.viewInsetsOf(context).bottom;
    double insetsTop = MediaQuery.paddingOf(context).top;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        width: q.width,
        height: q.height,
        child: Column(
          children: [
            Container(
              width: q.width,
              height: 209.0,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      stops: [.25, .6],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: Stack(
                children: [
                  Image.asset(
                    widget.court.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      top: 24.0 + insetsTop / 2,
                      left: 23.0,
                      right: 23.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const IconBackButton(),
                          GestureDetector(
                              child: Image.asset(
                            iconFavoriteAsset,
                            height: 30.0,
                          ))
                        ],
                      ))
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: AppColors.foreground,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 24.0),
                        decoration: const BoxDecoration(
                          color: AppColors.background,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 23.0),
                                child: CourtInfo(court: widget.court)),
                            const SizedBox(
                              height: 24.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 23.0),
                              child: CustomDropdownButton(
                                  width: 186.0,
                                  hintText: 'Agregar instructor',
                                  items: widget.court.instructors
                                      .map((instructor) =>
                                          CustomDropdownButtonItem(
                                              value: instructor,
                                              label: instructor))
                                      .toList(),
                                  onChange: (value) {
                                    if ((value as String)
                                            .compareTo(instructor) ==
                                        0) return;

                                    setState(() {
                                      instructor = value;
                                    });
                                  }),
                            ),
                            const SizedBox(
                              height: AppDesign.padding + 4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: AppDesign.padding * 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23.0),
                        child: Text(
                          'Establece fecha y hora',
                          style: textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23.0),
                          child: CustomDropdownDatetime(
                            onChange: (date) {
                              if (dateTime?.isAtSameMomentAs(date) == true) {
                                return;
                              }
                              setState(() {
                                dateTime = date;
                              });
                            },
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(23.0, 20.0, 23.0, 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: CustomDropdownTime(
                              label: 'Hora de inicio',
                              onChange: (value) {
                                setState(() {
                                  startTime = value;
                                });
                              },
                            )),
                            const SizedBox(
                              width: 12.8,
                            ),
                            Expanded(
                                child: CustomDropdownTime(
                              label: 'Hora de fin',
                              onChange: (value) {
                                setState(() {
                                  endTime = value;
                                });
                              },
                            ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23.0),
                        child: Text(
                          'Agregar comentario',
                          style: textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(
                        height: 15.5,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 23.0),
                          child: CommentTextFormField(
                            controller: _commentController,
                          )),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23.0),
                        child: Button(
                            onPressed: onReserve,
                            title: 'Reservar',
                            disabled: dateTime == null ||
                                startTime.isEmpty ||
                                endTime.isEmpty ||
                                instructor.isEmpty),
                      ),
                      SizedBox(
                        height: insetsBottom > 0 ? insetsBottom * .08 : 41.0,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  onReserve() {
    String comment = _commentController.text;

    if (comment.isNotEmpty) {
      _bloC.setComment(comment);
    }

    _bloC.setInstructor(instructor);
    _bloC.setDateTime(dateTime!);
    _bloC.setTime('$startTime a $endTime hrs');

    ReservationsProvider reservationsProvider =
        context.read<ReservationsProvider>();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider.value(
            value: reservationsProvider,
            child: PitchReservationPayScreen(reservation: _bloC.reservation))));

    setState(() {
      instructor = '';
      startTime = '';
      endTime = '';
      dateTime = null;
    });
  }
}

class CommentTextFormField extends StatelessWidget {
  const CommentTextFormField(
      {super.key, required TextEditingController controller})
      : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: AppColors.borderSecondary),
    );

    return TextFormField(
      controller: _controller,
      style: textTheme.bodyLarge,
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
          hintText: 'Agregar comentario',
          hintStyle:
              textTheme.bodyLarge!.copyWith(color: AppColors.mutedForeground),
          filled: true,
          fillColor: AppColors.background,
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: border,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)),
      maxLines: 5,
      minLines: 5,
    );
  }
}
