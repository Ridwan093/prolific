import 'package:flutter/material.dart';

class Routs {
  void goTo({required BuildContext context, required Widget routeName}) async {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => routeName)));
  }
}
