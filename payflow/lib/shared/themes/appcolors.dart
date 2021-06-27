import 'package:adobe_xd/adobe_xd.dart';
import 'package:flutter/material.dart';

class AppColors {
  static final primary = Color(0xFFFF941A);
  static final secondary = Color(0xFF585666);
  static final grey = Color(0xFF585666);
  static final delete = Color(0xFFE83F5B);
  static final heading = Color(0xFF585666);
  static final body = Color(0xFF706E7A);
  static final input = Color(0xFFB1B0B8);
  static final stroke = Color(0xFFE3E3E6);
  static final shape = Color(0xFFFAFAFC);
  static final background = Color(0xFFFFFFFF);

  static final decorationRadialGradient = BoxDecoration(
    gradient: RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      colors: [const Color(0xffffc380), const Color(0xffff941a)],
      stops: [0.0, 1.0],
      transform: GradientXDTransform(
        1.0,
        0.0,
        0.0,
        1.0,
        0.0,
        0.0,
        Alignment(0.0, 0.0),
      ),
    ),
  );
}
