import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sukabaca_clone/views/welcome.dart';
import 'core/utility/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: textTheme,
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColorDark: greyColor,
        primaryColorLight: whiteColor,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: whiteColor,
          iconTheme: IconThemeData(color: blackColor),
        ),
      ),
      home: const Welcome(),
    );
  }
}
