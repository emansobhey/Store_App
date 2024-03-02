import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:storeapp/helper/Api.dart';

class Category {
  Future<List<dynamic>> getAllCategory() async {
    
    List<dynamic> data = await  Api().get(urI: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
