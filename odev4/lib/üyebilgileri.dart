import 'package:flutter/material.dart';


Kisi yeniKisi = new Kisi(telefon:"111",soyisim: "dffds",isim: "ffsdfd");
class Uye{
  String Uyeisim;
  String KullaniciAdi;
  String Sifre;
  List<Kisi> RehberListesi = [yeniKisi];
  Uye(this.Uyeisim,this.KullaniciAdi,this.Sifre,){}
}

Uye Uye1=new Uye("ahmet","savasci","123",);
Uye Uye6=new Uye("yusuf","barisci","1234",);
Uye yeni=new Uye("q","w","1");
var UyeListesi=[Uye1,Uye6,yeni];



class Kisi{
  String isim;
  String soyisim;
  String telefon;
  Kisi({required this.isim,required this.soyisim,required this.telefon}){}
}

