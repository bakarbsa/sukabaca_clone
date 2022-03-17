import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color blackColor = const Color(0xff263238);
Color whiteColor = const Color(0xffFFFFFF);
Color greyColor = const Color(0xff979797);
Color redColor = const Color(0xffE74C3C);
Color yellowColor = const Color(0xffFFBB12);
Color greeenColor = const Color(0xff1BB55C);
Color pinkColor = const Color(0xffEF5DA8);
Color lightPurpleColor = const Color(0xffA5A6F6);
Color blueColor = const Color(0xffA0E4DA4);
Color purpleColor = const Color(0xff7879F1);

final textTheme = TextTheme(
  headline1: GoogleFonts.poppins(
    fontSize: 24,
    color: blackColor,
    fontWeight: FontWeight.w700,
  ),
  headline2: GoogleFonts.poppins(
    fontSize: 24,
    color: whiteColor,
    fontWeight: FontWeight.w700,
  ),
  headline3: GoogleFonts.poppins(
    fontSize: 24,
    color: greyColor,
    fontWeight: FontWeight.w700,
  ),
  subtitle1: GoogleFonts.poppins(
    fontSize: 17,
    color: blackColor,
    fontWeight: FontWeight.w700,
  ),
  subtitle2: GoogleFonts.poppins(
    fontSize: 17,
    color: greyColor,
    fontWeight: FontWeight.w400,
  ),
  bodyText1: GoogleFonts.poppins(
    fontSize: 16,
    color: blackColor,
    fontWeight: FontWeight.w700,
  ),
  bodyText2: GoogleFonts.poppins(
    fontSize: 16,
    color: greyColor,
    fontWeight: FontWeight.w400,
  ),
  caption: GoogleFonts.poppins(
    fontSize: 15,
    color: blackColor,
    fontWeight: FontWeight.w400,
  ),
  button: GoogleFonts.poppins(
    fontSize: 20,
    color: whiteColor,
    fontWeight: FontWeight.w600,
  ),
);
