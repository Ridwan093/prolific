import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prolific/Mobile/Mobile_getStart/WelcomScreen.dart';
import 'package:prolific/color_folder/allColors.dart';
import 'package:prolific/common/svg.dart';
import 'package:prolific/demo_image_link/imageWidget/cachImage.dart';
import 'package:prolific/demo_image_link/images.dart';
import 'package:prolific/fonts/font_names.dart';
import 'package:prolific/routes/simple_routs.dart';

class GetstartScreen extends StatelessWidget {
  const GetstartScreen({super.key});

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
                child: Stack(children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Svg(
                        height: 40,
                        width: 50,
                        imagepath: "assets/logo.svg",
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 20,
                      left: 20,
                      child: Text(
                        "Mange your\nteam & everything \nwith Prolific",
                        style: TextStyle(
                            fontFamily: montserrat,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ))
                ]),
              ),
              ImageWithPlaceholder(
                imageUrl: getStartImage,
                 height: 300,
                 width: size.width,
              ),
              // Image.network(
              //   getStartImage,
              //   height: 300,
              // ),
              const Svg(imagepath: "assets/works.svg", width: 100, height: 100),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: (() => Routs()
                    .goTo(context: context, routeName: const WelcomScreen())),
                child: Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: const Center(
                      child: Text("Let’s Start"),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
