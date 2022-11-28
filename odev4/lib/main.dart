import 'package:flutter/material.dart';
import 'package:odev4/anasayfa.dart';
import 'package:odev4/kayitpage.dart';

import 'Girispage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tel uygulaması',
      theme: ThemeData.dark(

      ),
      home: GirisPage(),

    );
  }
}

