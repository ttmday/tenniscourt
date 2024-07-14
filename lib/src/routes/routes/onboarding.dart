import 'package:go_router/go_router.dart';

import 'package:tenniscourt/src/screens/onboarding/onboarding.dart';

class OnboardingRoute {
  const OnboardingRoute._();

  static const name = 'onboarding';
  static const path = '/';

  static GoRoute get route => GoRoute(
        path: path,
        name: name,
        builder: (context, state) => const OnboardingScreen(),
      );
}
