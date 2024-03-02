import 'package:flutter/material.dart';
import 'package:storeapp/compunint/butuns.dart';
import 'package:storeapp/compunint/customer_button.dart';
import 'package:storeapp/page/login.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});
  static String id = 'WelcomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back.png'),
            fit: BoxFit.cover,
          ),
        ),
          child: Column(
            children: [
              const Spacer(
                flex:2 ,
              ),
              SizedBox(
                height: 15,
              ),CustomButon(onTap: (){
              Navigator.pushNamed(context, Loginpage.id);

              },text: 'Start',)]
      )));
  }
}
