import 'package:flutter/material.dart';
import 'package:storeapp/helper/Api.dart';
import 'package:storeapp/model/ptoductd_model.dart';

class AddProduct {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category}) async {
    Map<String, dynamic> data =
        await Api().post(urI: 'https://fakestoreapi.com/products?', boody: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
    });
    return ProductModel.fromJson(data);
  }
}
