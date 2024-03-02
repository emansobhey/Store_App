import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:storeapp/helper/conest.dart';


class Massge {
  final String text;
  final String Htime;
  final String Mtime;
  final String id;
  Massge(this.text, this.Htime, this.Mtime, this.id);

  factory Massge.fromJson(jsonData) {
    return Massge(
        jsonData[kmassage], jsonData[KcreateAtH], jsonData[KcreateAtM],jsonData['id']);
  }
}
