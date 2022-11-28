import 'package:flutter/material.dart';

import 'üyebilgileri.dart';

class ListelePage extends StatefulWidget {
  //const ListelePage({Key? key}) : super(key: key);
  Uye Uye2;
  ListelePage(this.Uye2);
  @override
  State<ListelePage> createState() => _ListelePageState(Uye2);
}
class _ListelePageState extends State<ListelePage> {
  Uye Uye2;

  _ListelePageState(this.Uye2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Padding(
         padding: const EdgeInsets.all(20.0),
         child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Card(
                    child: SizedBox(
                        width: 300,
                        height: 100,
                        child: Center(
                            child:
                                Column(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(Uye2.RehberListesi[index].isim.toString(),style: TextStyle(fontSize: 20),),
                                    Text(Uye2.RehberListesi[index].soyisim.toString()),
                                    Text(Uye2.RehberListesi[index].telefon.toString()),
                                  ],
                                ))),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                  );
                },
                childCount: Uye2.RehberListesi.length, // Kaç adet Liste oluşturacağını belirler.
              ),
            ),
          ],
      ),
       ),
    );
  }
}
