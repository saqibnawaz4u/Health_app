import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/constants/app_colors.dart';


class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxlines;
  TextDecoration? textDecoration;
  final bool? softWrap;


  CustomText(
      {Key? key,
        this.fontWeight,
        this.fontSize,
        this.textDecoration,
        required this.text,
        this.textAlign,
        this.maxlines,
        this.softWrap,
        this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxlines ?? 1,
      overflow: TextOverflow.visible,
      softWrap: softWrap ?? false,
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.mulish(
        color: color ?? AppColors.white,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration,
      ),
    );
  }
}
