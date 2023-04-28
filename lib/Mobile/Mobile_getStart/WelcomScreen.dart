import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prolific/Mobile/Mobile_Auth/sign_in.dart';

import 'package:prolific/color_folder/allColors.dart';
import 'package:prolific/common/svg.dart';
import 'package:prolific/fonts/font_names.dart';
import 'package:prolific/routes/simple_routs.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorConstants.mainColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 340,
                width: size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/bar.png",
                        ),
                        fit: BoxFit.cover)),
                child: Stack(children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 80),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Svg(
                        height: 70,
                        width: 50,
                        imagepath: "assets/logo.svg",
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: size.height / 2,
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                          fontFamily: montserrat,
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (() => Routs().goTo(
                                context: context, routeName:  SignIn())),
                            child: Image.asset(
                              "assets/Sign-in Button.png",
                              height: 90,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: (() => Routs().goTo(
                                context: context,
                                routeName: const WelcomScreen())),
                            child: Container(
                              height: 60,
                              width: 280,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.grey.shade300,
                                    width: 3,
                                  ),
                                  borderRadius: BorderRadius.circular(23)),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                          fontFamily: shipporiAntique,
                                          fontSize: 16,
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: Icon(
                                        Icons.arrow_forward,
                                        size: 34,
                                        color: Colors.grey.shade300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
