import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/sabitler.dart';
import 'package:flutter/material.dart';
import 'hesap.dart';

class SonucSayfasi extends StatelessWidget {
  SonucSayfasi(
      {@required this.bkiSinif,
      @required this.bkiDeger,
      @required this.bkiAciklama});

  final String bkiSinif;
  final String bkiDeger;
  final String bkiAciklama;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BKİ HESAPLAMA'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Sonuç',
                style: kSonucBaslik,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusable_Card(
              renk: kAktifKartRenk,
              CardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    bkiDeger,
                    style: kSonuc,
                  ),
                  Text(
                    bkiSinif,
                    style: kBKIDeger,
                  ),
                  Text(
                    bkiAciklama,
                    style: kBKIAciklama,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: kAltContainerRenk,
              height: kAltButtonYukseklik,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  'TEKRAR HESAPLA',
                  style: kBuyukButon,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
