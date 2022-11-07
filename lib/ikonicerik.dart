import 'package:flutter/material.dart';
import 'package:bmi_calculator/sabitler.dart';

class IconIcerik extends StatelessWidget {
  IconIcerik({@required this.ikon, this.cinsiyet});
  final IconData ikon;
  final String cinsiyet;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ikon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          cinsiyet,
          style: kEtiketStili,
        ),
      ],
    );
  }
}
