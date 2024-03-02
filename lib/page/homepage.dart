import 'package:flutter/material.dart';
import 'package:storeapp/compunint/customer_card.dart';
import 'package:storeapp/helper/showsnakbar.dart';
import 'package:storeapp/model/ptoductd_model.dart';
import 'package:storeapp/page/login.dart';
import 'package:storeapp/servise/get_all_prodect.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePAge';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffBD8F63),
        actions: [
          Icon(
            Icons.add_shopping_cart,
            color: Color.fromARGB(255, 193, 113, 39),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Loginpage.id);
                },
                icon: Icon(
                  Icons.login,
                  color: Color.fromARGB(255, 193, 113, 39),
                )),
          ),
        ],
        elevation: 0,
        centerTitle: true,
        title: Text(
          'New Store',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProducts().getallproducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 100,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(product: products[index]);
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
