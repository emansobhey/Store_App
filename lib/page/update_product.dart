import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/compunint/customer_button.dart';
import 'package:storeapp/compunint/customer_textFiles.dart';
import 'package:storeapp/helper/showsnakbar.dart';
import 'package:storeapp/model/ptoductd_model.dart';
import 'package:storeapp/servise/updet_prodect.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;
  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Color(0xffBD8F63),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/3.png'), // Change this to your image path
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 320,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      productName = data;
                    },
                    hintText: 'Product Name',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      desc = data;
                    },
                    hintText: 'Description',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      price = data;
                    },
                    hintText: 'Price',
                    inputType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    onChanged: (data) {
                      image = data;
                    },
                    hintText: 'Image',
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  CustomButon(
                    text: 'Update',
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await updateProduct(product);
                        showsnakbar(context, 'Success');
                        Navigator.pop(context);
                      } catch (e) {
                        // showsnakbar(context, '');
                        print(e.toString());
                        Navigator.pop(context);
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }
}
