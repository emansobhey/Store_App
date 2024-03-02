import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:storeapp/helper/Api.dart';
import 'package:storeapp/model/ptoductd_model.dart';

class categories {
  Future<List<ProductModel>> getCategriesProducts(
      {required String categoryName}) async {
    List<dynamic> data = await Api()
        .get(urI: 'https://fakestoreapi.com/products/category/$categoryName');
    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productsList;
  }
}
