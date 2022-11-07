import 'package:bmi_calculator/hesap.dart';
import 'package:bmi_calculator/sonuc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/ikonicerik.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/sabitler.dart';
import 'sonuc.dart';
import 'hesap.dart';

enum Cinsiyet {
  erkek,
  kadin,
}

class VeriGiris extends StatefulWidget {
  @override
  _VeriGirisState createState() => _VeriGirisState();
}

class _VeriGirisState extends State<VeriGiris> {
  Color erkekKartRenk = kPasifKartRenk;
  Color kadinKartRenk = kPasifKartRenk;

  Cinsiyet seciliCinsiyet;
  int boy = 180;
  int kilo = 60;
  int yas = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BKI HESAPLAMA'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable_Card(
                    cinsiyetTiklama: () {
                      setState(() {
                        seciliCinsiyet == Cinsiyet.erkek;
                      });
                    },
                    renk: seciliCinsiyet == Cinsiyet.erkek
                        ? kAktifKartRenk
                        : kPasifKartRenk,
                    CardChild: IconIcerik(
                      ikon: FontAwesomeIcons.mars,
                      cinsiyet: 'ERKEK',
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable_Card(
                    cinsiyetTiklama: () {
                      setState(() {
                        seciliCinsiyet == Cinsiyet.kadin;
                      });
                    },
                    renk: seciliCinsiyet == Cinsiyet.kadin
                        ? kAktifKartRenk
                        : kPasifKartRenk,
                    CardChild: IconIcerik(
                      ikon: FontAwesomeIcons.venus,
                      cinsiyet: 'KADIN',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Reusable_Card(
              renk: kAktifKartRenk,
              CardChild: (Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'BOY',
                    style: kEtiketStili,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        boy.toString(),
                        style: kSayiStili,
                      ),
                      Text(
                        'cm',
                        style: kEtiketStili,
                      ),
                    ],
                  ),
                  Slider(
                      value: boy.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double yeniBoyDeger) {
                        setState(() {
                          boy = yeniBoyDeger.round();
                        });
                      }),
                ],
              )),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Reusable_Card(
                    renk: kAktifKartRenk,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'KİLO',
                          style: kEtiketStili,
                        ),
                        Text(
                          kilo.toString(),
                          style: kSayiStili,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            yuvarlakIkonButon(
                              ikon: FontAwesomeIcons.minus,
                              tiklama: () {
                                setState(() {
                                  kilo--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            yuvarlakIkonButon(
                              ikon: FontAwesomeIcons.plus,
                              tiklama: () {
                                setState(() {
                                  kilo++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reusable_Card(
                    renk: kAktifKartRenk,
                    CardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'YAŞ',
                          style: kEtiketStili,
                        ),
                        Text(
                          yas.toString(),
                          style: kSayiStili,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            yuvarlakIkonButon(
                              ikon: FontAwesomeIcons.minus,
                              tiklama: () {
                                setState(() {
                                  yas--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            yuvarlakIkonButon(
                              ikon: FontAwesomeIcons.plus,
                              tiklama: () {
                                setState(() {
                                  yas++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BKIHesap calc = BKIHesap(bireyBoy: boy, bireyKilo: kilo);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SonucSayfasi(
                    bkiSinif: calc.bkihesapla(),
                    bkiDeger: calc.sonucSiniflama(),
                    bkiAciklama: calc.sonucAciklamasi(),
                  ),
                ),
              );
            },
            child: Container(
              color: kAltContainerRenk,
              height: kAltButtonYukseklik,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  'HESAPLA',
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

class yuvarlakIkonButon extends StatelessWidget {
  yuvarlakIkonButon({@required this.ikon, @required this.tiklama});
  final IconData ikon;
  final Function tiklama;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(ikon),
      onPressed: tiklama,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
