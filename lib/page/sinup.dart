import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/compunint/butuns.dart';
import 'package:storeapp/compunint/customer_button.dart';
import 'package:storeapp/compunint/textfiled.dart';
import 'package:storeapp/helper/showsnakbar.dart';
import 'package:storeapp/page/homepage.dart';
import 'package:storeapp/page/login.dart';

class SinUpPage extends StatefulWidget {
  SinUpPage({super.key});
  static String id = 'Sin Up Page';

  @override
  State<SinUpPage> createState() => _SinUpPageState();
}

class _SinUpPageState extends State<SinUpPage> {
  String? email;

  String? password;

  bool isLoad = false;

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
                      '  SIN UP',
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
                  hintText: '    Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),

                const SizedBox(
                  height: 20,
                ), // Text
                Textfeild.custamTextFormfeild(
                  hintText: '   Password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                const SizedBox(
                  height: 20,
                ), // Text

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomButon(
                    text: 'Sin up',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoad = true;
                        setState(() {});
                        try {
                          await registerUser();
                          Navigator.pushNamed(context, HomePage.id);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showsnakbar(context, 'weak password');
                          } else if (e.code == 'email-already-in-use') {
                            // showsnakbar(context, 'email already used');
                          }
                        } catch (e) {
                          showsnakbar(context, e.toString());
                        }

                        isLoad = false;
                        setState(() {});
                      }
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
                      'Aready have an account ? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(' Log in',
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

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
