import 'package:flutter/material.dart';
import 'package:odev4/anasayfa.dart';

import 'Girispage.dart';
import 'üyebilgileri.dart';

class EklePage extends StatefulWidget {
  //const EklePage({Key? key}) : super(key: key);
  Uye Uye2;
  EklePage(this.Uye2);
  @override
  State<EklePage> createState() => _EklePageState(Uye2);
}

class _EklePageState extends State<EklePage> {
  int ekleyebilir=0;
  Uye Uye2;
  _EklePageState(this.Uye2);

  final _formKey2 = GlobalKey<FormState>();
  TextEditingController isimController=new TextEditingController();
  TextEditingController soyisimController=new TextEditingController();
  TextEditingController telefonController=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ekleme Sayfası"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Rehbere Ekle',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey2,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: isimController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'boş kalamaz';
                            }
                            return null;
                          },


                          decoration: InputDecoration(
                            hintText: 'isim',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(

                          controller: soyisimController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'boş kalamaz';
                            }
                            return null;
                          },

                          decoration: InputDecoration(
                            hintText: 'soyisim',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: telefonController,
                    validator: (value) {
                      if ( value?.length == 0) {
                        return 'telefon numarası giriniz';
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      hintText: 'telefon numarası',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_formKey2.currentState!.validate() ) {
                          String isimm=isimController.text;
                          String soyisim=soyisimController.text;
                          String telefon=telefonController.text;

                          for(int i=0;i<Uye2.RehberListesi.length;i++){
                            if(telefonController.text==Uye2.RehberListesi[i].telefon){
                              print("ekleyemezsin");
                              ekleyebilir=1;
                            }

                          }
                          if(ekleyebilir==0){
                            Kisi  YeniKisi =new Kisi(isim: isimm,soyisim: soyisim,telefon: telefon);
                            Uye2.RehberListesi.add(YeniKisi);
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Anasayfa(Uye2: Uye2),), (route) => false);

                          }


                        }




                      });

                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text(
                      'Rehbere Ekle',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Geri"))

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
