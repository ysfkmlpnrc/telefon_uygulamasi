import 'package:flutter/material.dart';
import 'package:odev4/Girispage.dart';

import 'üyebilgileri.dart';


class KayitPage extends StatefulWidget {
  //const KayitPage({Key? key}) : super(key: key);

  //final String title;

  @override
  State<KayitPage> createState() => _KayitPageState();
}

class _KayitPageState extends State<KayitPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController UyeAdiController = new TextEditingController();
  TextEditingController KullaniciAdiController = new TextEditingController();
  TextEditingController EmailController = new TextEditingController();
  TextEditingController SifreController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sign up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: UyeAdiController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'boş kalamaz';
                            }
                            return null;
                          },


                          decoration: InputDecoration(
                            hintText: 'Üye Adı',
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

                          controller: KullaniciAdiController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'boş kalamaz';
                            }
                            return null;
                          },

                          decoration: InputDecoration(
                            hintText: 'Kullanıcı Adı',
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
                    controller: EmailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'boş kalamaz';
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: SifreController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'boş kalamaz';
                      }
                      return null;
                    },


                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Enter your password',
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
                      if (_formKey.currentState!.validate()) {
                        String Uyeisim=UyeAdiController.text;
                        String sifre=SifreController.text;
                        String kullaniciAdi=KullaniciAdiController.text;
                        Uye  YeniUye =new Uye(Uyeisim,kullaniciAdi,sifre,);

                        UyeListesi.add(YeniUye);

                        Navigator.pushReplacement(context, MaterialPageRoute(builder:
                            (context)=>GirisPage()));

                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                    ),
                    child: const Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}