import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/firebase_options.dart';
import 'package:storeapp/page/homepage.dart';
import 'package:storeapp/page/login.dart';
import 'package:storeapp/page/sinup.dart';
import 'package:storeapp/page/update_product.dart';
import 'package:storeapp/page/welome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const storeApp());
}

class storeApp extends StatelessWidget {
  const storeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Loginpage.id: (context) => Loginpage(),
        SinUpPage.id: (context) => SinUpPage(),
        HomePage.id: (context) => HomePage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
        WelcomePage.id: (context) => WelcomePage(),
      },
      initialRoute: WelcomePage.id,
    );
  }
}
