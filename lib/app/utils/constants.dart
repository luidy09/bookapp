import 'package:flutter/material.dart';

const Color intenseGray = Color(0xFFc2c2c2);

const Color simpleGray = Color(0xfff5f5f5);
const progressColor = Color(0xff8ce0d7);

getProgressColor(percent) {
  return (percent < 30)
      ? Colors.redAccent.withOpacity(0.7)
      : (percent >= 30 && percent < 60)
          ? Colors.orange.withOpacity(0.5)
          : Color(0xff8ce0d7);
}
