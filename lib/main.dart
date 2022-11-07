import 'package:flutter/material.dart';
import 'package:bmi_calculator/veri_giris.dart';

void main() => runApp(BKIhesap());

class BKIhesap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0D22),
        scaffoldBackgroundColor: Color(0xFF0A0D22),
      ),
      home: VeriGiris(),
    );
  }
}
