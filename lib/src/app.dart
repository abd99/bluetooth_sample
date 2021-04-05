import 'package:bluetooth_sample/src/screens/home_page.dart';
import 'package:flutter/material.dart';

class BluetoothApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bluetooth Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
        ),
      ),
      home: HomePage(),
    );
  }
}
