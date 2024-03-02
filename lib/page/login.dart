
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/compunint/butuns.dart';
import 'package:storeapp/compunint/customer_button.dart';
import 'package:storeapp/compunint/textfiled.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:storeapp/helper/showsnakbar.dart';
import 'package:storeapp/page/homepage.dart';
import 'package:storeapp/page/sinup.dart';
class Loginpage extends StatefulWidget {
  Loginpage({super.key});
  static String id = 'LogInPage';

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool isLoad = false;
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoad,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/2.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                SizedBox(
                  height: 15,
                ),
                // const Text('Chat App',
                //     style: TextStyle(
                //       fontSize: 32,
                //       fontFamily: 'Pacifico',
                //       color: Colors.black,
                //     ) // TextStyle
                //     ),
                // const Spacer(
                //   flex: 2,
                // ), // Text
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '  Log in',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ), // TextStyle
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ), // Text
                 Textfeild.custamTextFormfeild(
                  hintText: '   Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 20,
                ), // Text
                Textfeild.custamTextFormfeild(
                  obscureText: true,
                  hintText: '   Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 20,
                ), // Text

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButon(
                    text: 'Log in',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoad = true;
                        setState(() {});
                        try {
                          await loginuser();
                          Navigator.pushNamed(context,HomePage.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            showsnakbar(context, 'user not found');
                          } else if (e.code == 'invalid-credential') {
                            showsnakbar(context, 'wrong password');
                          }
                        } catch (e) {
                         showsnakbar(context, e.toString());
                        }
                
                        isLoad = false;
                        setState(() {});
                      } else {}
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ), // Text
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account ? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SinUpPage.id);
                      },
                      child: const Text(' Sin up',
                          style: TextStyle(
                              fontSize: 15, color: Color(0xffC7EDE6))),
                    )
                  ],
                ),
                const Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginuser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
