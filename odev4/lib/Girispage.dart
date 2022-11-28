import 'package:flutter/material.dart';
import 'package:odev4/%C3%BCyebilgileri.dart';
import 'package:odev4/anasayfa.dart';
import 'package:odev4/kayitpage.dart';
import 'package:odev4/stil.dart';

class GirisPage extends StatefulWidget {
  //const GirisPage({Key? key}) : super(key: key);

  @override
  State<GirisPage> createState() => _GirisPageState();
}

class _GirisPageState extends State<GirisPage> {
  int varMi = 0;
  final formKey = GlobalKey<FormState>();
  TextEditingController Isimcontroller = new TextEditingController();
  TextEditingController SifreControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Giris Ekranı")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Giris Ekranı",
                  textAlign: TextAlign.center, style: stil),
              SizedBox(height: 20),
              TextFormField(
                controller: Isimcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: "Kullanıcı Adınız",
                    labelText: "Kullanıcı Adı",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "boş kalamaz";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: SifreControler,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "sifre",
                  labelText: ("Sifreniz"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "boş kalamaz";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      for (int i = 0; i < UyeListesi.length; i++) {
                        if (Isimcontroller.text == UyeListesi[i].KullaniciAdi &&
                            SifreControler.text == UyeListesi[i].Sifre) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Anasayfa(
                                        Uye2: UyeListesi[i],
                                      )));
                          print("haydac");
                          varMi = 1;
                        }
                      }
                      if (varMi == 0) {
                        showAlertDialog6(context,Isimcontroller.text);
                      }
                    }
                  },
                  child: Text("Giris"),
                ),
              ),

              SizedBox(height:20 ,),
              SizedBox(
                width: 150,
                child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => KayitPage()));

                      //Navigator.push(context, MaterialPageRoute(builder: (context) => KayitPage(),));
                    },
                    child: Text("Kayıt Ol")),
              )
            ],
          ),
        ),
      ),
    );
  }
}



showAlertDialog6(BuildContext context,String isim) {
  Widget TamamButton = TextButton(
    child: Text("Tamam"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );


  AlertDialog alert2=AlertDialog(
    title: Text("sayın $isim"),
    content: Text("Sisteme Kayıtlı değilsiniz"),
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