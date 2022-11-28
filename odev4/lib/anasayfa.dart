import 'package:flutter/material.dart';
import 'package:odev4/duzenle.dart';
import 'package:odev4/eklepage.dart';

import 'listele.dart';
import 'üyebilgileri.dart';

class Anasayfa extends StatefulWidget {
//  const Anasayfa({Key? key}) : super(key: key);
  Uye Uye2;

  Anasayfa({required this.Uye2});

  @override
  State<Anasayfa> createState() => _AnasayfaState(Uye2);
}

class _AnasayfaState extends State<Anasayfa> {
  Uye Uye2;

  _AnasayfaState(this.Uye2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Uye2.Uyeisim),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EklePage(Uye2),
                            ));
                      },
                      child: Text("Ekle")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DuzenlePage(
                                Uye2: Uye2,
                              ),
                            ));
                      },
                      child: Text("Bul-Düzenle-Sil")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListelePage(Uye2),
                            ));
                      },
                      child: Text("Listele")),
                ),
              ),
            ]),
      ),
    );
  }
}
