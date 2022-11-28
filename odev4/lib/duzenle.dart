import 'package:flutter/material.dart';
import 'package:odev4/anasayfa.dart';
import 'package:odev4/listele.dart';

import 'Girispage.dart';
import 'üyebilgileri.dart';

class DuzenlePage extends StatefulWidget {
  //const EklePage({Key? key}) : super(key: key);

  Uye Uye2;
  DuzenlePage({required this.Uye2});

  @override
  State<DuzenlePage> createState() => _DuzenlePageState(Uye2: Uye2);
}

class _DuzenlePageState extends State<DuzenlePage> {
  showAlertDialog3(BuildContext context,Kisi yerelKisi,Uye Uye2) {
    Widget EvetButton = TextButton(
      child: Text("Evet"),
      onPressed:  () {
        for(int i=0;i<Uye2.RehberListesi.length;i++){
          print("df");
          if(telefonController.text==Uye2.RehberListesi[i].telefon){
            Uye2.RehberListesi.removeAt(i);
          }
        }
        print(telefonController.text);
        telefonController.clear();
        isimController.clear();
        soyisimController.clear();
        Navigator.pop(context);

      },
    );
    Widget HayirButton = TextButton(
      child: Text("Hayir"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert3 = AlertDialog(
      title: Text("Emin misin?"),
      content: Text("Silmek istediğinizden emin misiniz?"),
      actions: [
        EvetButton,
        HayirButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert3;
      },
    );
  }
  showAlertDialog4(BuildContext context,Kisi yerelKisi,Uye Uye2) {
    Widget EvetButton = TextButton(
      child: Text("Evet"),
      onPressed:  () {
        setState(() {
          for(int i=0;i<Uye2.RehberListesi.length;i++){
            if(telefonController.text==Uye2.RehberListesi[i].telefon){
              Uye2.RehberListesi[i].isim=isimController.text;
            }
          }
        //  yerelKisi.isim=isimController.text;
          //yerelKisi.soyisim=soyisimController.text;
          //yerelKisi.telefon=telefonController.text;
          isimController.clear();
          telefonController.clear();
          soyisimController.clear();
          //Uye2.RehberListesi.add(yerelKisi);
          Navigator.pop(context);
        });

      },
    );
    Widget HayirButton = TextButton(
      child: Text("Hayir"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert3 = AlertDialog(
      title: Text("Vay"),
      content: Text("düzenlemek istediğinizden emin misiniz?"),
      actions: [
        EvetButton,
        HayirButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert3;
      },
    );
  }
  Uye Uye2;
  _DuzenlePageState({required this.Uye2});
  final _formKey3 = GlobalKey<FormState>();
  TextEditingController isimController=new TextEditingController();
  TextEditingController soyisimController=new TextEditingController();
  TextEditingController telefonController=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Kisi yerelKisi=new Kisi(isim: "yok", soyisim: "yok", telefon: "yok");
    int sayac=0;
    int bayrak=0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Bul Düzenle Sil"),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Form(
              key: _formKey3,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: isimController,
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

                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: (){
                    setState(() {
                    if(isimController.text.isNotEmpty){
                      sayac+=1;
                    }
                    if(soyisimController.text.isNotEmpty){
                      sayac+=1;
                    }
                    if(telefonController.text.isNotEmpty){
                      sayac+=1;
                    }

                    if(sayac!=1){
                      showAlertDialog2(context);
                      telefonController.clear();
                      soyisimController.clear();
                      isimController.clear();
                      sayac=0;


                    }
                    else{
                      for(int i=0;i<Uye2.RehberListesi.length;i++){
                        if(telefonController.text==Uye2.RehberListesi[i].telefon ||
                        isimController.text==Uye2.RehberListesi[i].isim||
                            soyisimController.text==Uye2.RehberListesi[i].soyisim
                        ){
                          yerelKisi =Uye2.RehberListesi[i];
                          telefonController.text=Uye2.RehberListesi[i].telefon;
                          isimController.text=Uye2.RehberListesi[i].isim;
                          soyisimController.text=Uye2.RehberListesi[i].soyisim;
                          bayrak=1;
                          break;
                        }
                      }
                      if(bayrak==0){
                        showAlertDialog(context);
                        telefonController.clear();
                        soyisimController.clear();
                        isimController.clear();
                      }
                    }
                    });

                  }, child: Text("Bul")),

                  ElevatedButton(onPressed: (){
                    setState(() {


                      showAlertDialog4(context, yerelKisi, Uye2);
                    });


                  }, child: Text("Düzenle")),
                  ElevatedButton(onPressed: (){
                    if(isimController.text.isNotEmpty){
                      sayac+=1;
                    }
                    if(soyisimController.text.isNotEmpty){
                      sayac+=1;
                    }
                    if(telefonController.text.isNotEmpty){
                      sayac+=1;
                    }

                    if(sayac==3){
                    setState(() {
                      showAlertDialog3(context, yerelKisi, Uye2);
                    });
                    }
                    else{
                      showAlertDialog5(context);
                    }




                  }, child: Text("Sil")),


                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Anasayfa")),

                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}
showAlertDialog(BuildContext context) {
  Widget TamamButton = TextButton(
    child: Text("Tamam"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );


  AlertDialog alert = AlertDialog(
    title: Text("Tüh"),
    content: Text("Aradığınız Kişiyi Bulamadık"),
    actions: [
      TamamButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


showAlertDialog2(BuildContext context) {
  Widget TamamButton = TextButton(
    child: Text("Tamam"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );


  AlertDialog alert2=AlertDialog(
    title: Text("Ne yazık"),
    content: Text("Sadece bir alan dolu olmalı"),
    actions: [TamamButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert2;
    },
  );
}


showAlertDialog5(BuildContext context) {
  Widget TamamButton = TextButton(
    child: Text("Tamam"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );


  AlertDialog alert2=AlertDialog(
    title: Text("Silinecek bir şey yok"),
    content: Text("Bir şey Eklemeden Silemezsin"),
    actions: [TamamButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert2;
    },
  );
}
