import 'package:flutter/material.dart';
import 'package:tenniscourt/src/constants/images_assets.dart';

class TenniscourtLogo extends StatelessWidget {
  const TenniscourtLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 209.0,
      height: 148.0,
      child: Image.asset(
        imageLogoAsset,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
