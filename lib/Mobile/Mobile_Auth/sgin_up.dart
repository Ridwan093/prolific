import 'package:flutter/material.dart';
import 'package:prolific/Widgets/reUsableTextFiled.dart';
import 'package:prolific/color_folder/allColors.dart';

import 'package:prolific/fonts/font_names.dart';
import 'package:prolific/routes/simple_routs.dart';
import 'package:prolific/user_Darsbord/user_HomePage.dart';
import 'package:prolific/user_Darsbord/user_darsbord.dart';

class Sign_Up extends StatelessWidget {
  Sign_Up({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final teamNameController = TextEditingController();
  final fullnameController = TextEditingController();
  final phoneNumberController = TextEditingController();

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
                          "assets/sign_up.png",
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
                      "Sign Up",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          fontFamily: montserrat,
                          fontSize: 34,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    ReusableTextFiled(
                        controller: teamNameController,
                        lableText: "Team Name:",
                        textInputType: TextInputType.name,
                        suffixIcon: Icon(
                          Icons.done,
                          color: ColorConstants.mainColor,
                        )),
                    ReusableTextFiled(
                      controller: teamNameController,
                      lableText: "Full Name:",
                      textInputType: TextInputType.name,
                      suffixIcon: const SizedBox(),
                    ),
                    EmailTextField(
                      controller: emailController,
                    ),
                    ReusableTextFiledpass(
                      controller: passController,
                      hintText: 'Password',
                      textInputType: TextInputType.text,
                    ),
                    ReusableTextFiled(
                      controller: teamNameController,
                      lableText: "Phone no: (Whatsapp)",
                      textInputType: TextInputType.number,
                      suffixIcon: const SizedBox(),
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
                      Routs().goTo(context: context, routeName:  UserHome())),
                  child: Image.asset(
                    "assets/Sign-up Button.png",
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
