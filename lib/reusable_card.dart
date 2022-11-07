import 'package:flutter/material.dart';

class Reusable_Card extends StatelessWidget {
  Reusable_Card({@required this.renk, this.CardChild, this.cinsiyetTiklama});
  final Color renk;
  final Widget CardChild;
  final Function cinsiyetTiklama;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: cinsiyetTiklama,
      child: Container(
        child: CardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: renk,
        ),
      ),
    );
  }
}
