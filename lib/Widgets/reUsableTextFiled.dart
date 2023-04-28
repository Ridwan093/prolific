// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:prolific/color_folder/allColors.dart';
import 'package:prolific/fonts/font_names.dart';

class ReusableTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String lableText;
  final Widget suffixIcon;
  ReusableTextFiled(
      {super.key,
      required this.controller,
      required this.lableText,
      required this.textInputType,
      required this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return TextField(
        autofocus: false,
        keyboardType: textInputType,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF5B3715)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF5B3715), width: 2),
            ),
            labelText: lableText,
            labelStyle: TextStyle(
                fontFamily: shipporiAntique, color: Colors.grey.shade400),
            suffixIcon: suffixIcon),
      );
    });
  }
}

class EmailTextField extends StatefulWidget {
  final TextEditingController controller;
  const EmailTextField({Key? key, required this.controller}) : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF5B3715)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF5B3715), width: 2),
        ),
        labelText: 'Email Address',
        labelStyle: TextStyle(
            fontFamily: shipporiAntique,
            color: Colors.grey.shade400,
         ),
        suffixIcon: Icon(
          _isValid ? Icons.check : Icons.clear,
          color: _isValid ? ColorConstants.mainColor : Colors.red,
        ),
      ),
      onChanged: (value) {
        setState(() {
          _isValid = isValidEmail(value);
        });
      },
    );
  }

  bool isValidEmail(String email) {
    // Define the regular expression pattern for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    // Check if the email matches the pattern
    return emailRegExp.hasMatch(email);
  }
}

class ReusableTextFiledpass extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String hintText;

  ReusableTextFiledpass(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.textInputType});
  bool isvesible = false;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return TextField(
        autofocus: false,
        keyboardType: textInputType,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF5B3715)),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF5B3715), width: 2),
            ),
            labelText: hintText,
            labelStyle: TextStyle(
                fontFamily: shipporiAntique, color: Colors.grey.shade400),
            suffixIcon: IconButton(
                onPressed: (() {
                  setState((() {
                    isvesible = !isvesible;
                  }));
                }),
                icon: Icon(
                  isvesible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ))),
        obscureText: !isvesible,
      );
    });
  }
}
