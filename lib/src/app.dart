import 'package:bluetooth_sample/src/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BluetoothApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      title: 'Flutter Bluetooth Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          headline1: GoogleFonts.quicksand(
            fontSize: 99,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
          ),
          headline2: GoogleFonts.quicksand(
            fontSize: 62,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
          ),
          headline3: GoogleFonts.quicksand(
            fontSize: 49,
            fontWeight: FontWeight.w400,
          ),
          headline4: GoogleFonts.quicksand(
            fontSize: 35,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          headline5: GoogleFonts.quicksand(
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
          headline6: GoogleFonts.quicksand(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.15,
          ),
          subtitle1: GoogleFonts.quicksand(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.15,
          ),
          subtitle2: GoogleFonts.quicksand(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
          bodyText1: GoogleFonts.quicksand(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          bodyText2: GoogleFonts.quicksand(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ),
          button: GoogleFonts.quicksand(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.25,
          ),
          caption: GoogleFonts.quicksand(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.4,
          ),
          overline: GoogleFonts.quicksand(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.5,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
