import 'package:flutter/material.dart';

class Textfeild extends StatelessWidget {
  Textfeild.custamTextFormfeild({this.hintText, this.onChanged,this.obscureText=false});
  String? hintText;
  bool? obscureText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
          obscureText:obscureText!,
          validator: (value) {
            if (value!.isEmpty) return 'Field is required ';
          },
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          )),
    );
  }
}
