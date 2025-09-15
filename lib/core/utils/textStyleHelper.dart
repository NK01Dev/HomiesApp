import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyleHelper {
  static const String _fontFamily = 'Poppins';
  static const FontWeight _defaultWeight = FontWeight.w500;
  static TextStyle textStyle24({Color color = Colors.black}) =>
      _baseStyle(24, color);
  static TextStyle textStyle18({Color color = Colors.black}) =>
      _baseStyle(18, color);

  static TextStyle textStyle16({Color color = Colors.black}) =>
      _baseStyle(16, color);

  static TextStyle textStyle14({Color color = Colors.black}) =>
      _baseStyle(14, color);

  static TextStyle textStyle13({Color color = Colors.black}) =>
      _baseStyle(13, color);

  static TextStyle textStyle12({Color color = Colors.black}) =>
      _baseStyle(12, color);

  static TextStyle textStyle11({Color color = Colors.black}) =>
      _baseStyle(11, color);

  static TextStyle textStyle10({Color color = Colors.black}) =>
      _baseStyle(10, color);

  static TextStyle textStyle9({Color color = Colors.black}) =>
      _baseStyle(9, color);

  static TextStyle textStyle8({Color color = Colors.black}) =>
      _baseStyle(8, color);

  static TextStyle _baseStyle(double fontSize, Color color) {
    return TextStyle(
      fontSize: fontSize.sp, // كي adapti مع الشاشة
      fontFamily: _fontFamily,
      fontWeight: _defaultWeight,
      color: color,
    );
  }
}
