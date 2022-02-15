import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:project/Core/constants/colors.dart';
import 'package:project/UI/screens/home_screen.dart';

import 'calculators/firstthreescreens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  delay() async {
    await Future.delayed(const Duration(seconds: 7));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const firstthreescreens()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainAppColor,
      body: Center(
        child: AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            TypewriterAnimatedText(
              "Medxir ",
              textStyle: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              speed: const Duration(seconds: 1)
            ),
            //Duration(int seconds: 4),
          ],
         // pause: const Duration(seconds: 2),
        ),
      ),
    );
  }
}
