import 'package:flutter/material.dart';
import 'package:tenniscourt/src/constants/images_assets.dart';

class TenniscourtBackgroundTop extends StatelessWidget {
  const TenniscourtBackgroundTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'tenniscourtbackground',
      child: SizedBox(
        height: 242.0,
        child: Image.asset(
          imageLogoTopAsset,
        ),
      ),
    );
  }
}
