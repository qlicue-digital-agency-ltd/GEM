import 'dart:ui';

import 'package:flutter/material.dart';

class Colors {
  const Colors();

  static const Color loginGradientStart = const Color(0xFFffffff);
  static const Color loginGradientEnd = const Color(0xFFdc641a);
  static const Color loginButtonMix = const Color(0xFFeb66f30);
  static const Color gemPrimaryColor = const Color(0xFF00d0cb);
  static const Color gemSecondaryColor = const Color(0xFFdc641a);
  static const Color gemTertiaryColor = const Color(0xFF00d0cb);

  static const prmaryGradient = const LinearGradient(
      colors: const [loginGradientStart, loginGradientEnd],
      stops: const [0.0, 1.0],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
}
