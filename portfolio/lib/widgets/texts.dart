import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

Widget reusableText({
  required String text,
  List<dynamic>? fontStyle,
  Color? color,
  TextAlign? textAlign,
}) {
  double fontSize = fontStyle?[0] ?? 16.0;
  FontWeight fontWeight = fontStyle?[1] ?? FontWeight.normal;

  return Text(
    text,
    style: GoogleFonts.montserrat(
      fontSize: fontSize,
      color: color ?? AppColors.creamyIvory,
      fontWeight: fontWeight,
    ),
    textAlign: textAlign ?? TextAlign.center,
  );
}