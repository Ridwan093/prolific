import 'package:flutter/material.dart';
import 'package:prolific/Mobile/Mobile_Auth/sgin_up.dart';
import 'package:prolific/Widgets/reUsableTextFiled.dart';

import 'package:prolific/fonts/font_names.dart';
import 'package:prolific/routes/simple_routs.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 340,
                width: size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/sign_bar.png",
                        ),
                        fit: BoxFit.cover)),
                child: Stack(children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 40),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Colors.white,
                        )),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Wrap(
                  runSpacing: 30,
                  children: [
                    Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontFamily: montserrat,
                          fontSize: 34,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    EmailTextField(
                      controller: emailController,
                    ),
                    ReusableTextFiledpass(
                      controller: passController,
                      hintText: 'Password',
                      textInputType: TextInputType.text,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontFamily: shipporiAntique,
                              color: const Color(0xFF5B3715),
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              decorationStyle: TextDecorationStyle.solid),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Center(
                child: InkWell(
                  onTap: (() =>
                      Routs().goTo(context: context, routeName: Sign_Up())),
                  child: Image.asset(
                    "assets/Sign-in Button.png",
                    height: 90,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
