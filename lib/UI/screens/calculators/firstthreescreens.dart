import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Core/constants/colors.dart';
import 'package:project/UI/screens/home_screen.dart';

class firstthreescreens extends StatefulWidget {
  const firstthreescreens({Key? key}) : super(key: key);

  @override
  _firstthreescreensState createState() => _firstthreescreensState();
}

class _firstthreescreensState extends State<firstthreescreens> {
  final _totalDots = 3;
  int _currentPosition = 0;
  List<String> logos = [
    'assets/decision.png',
    'assets/condition.png',
    'assets/decision.png'
  ];
  List<String> mainScreenImages = [
    'assets/pill1.png',
    'assets/procedures1.png',
    'assets/searchpill.png'
  ];
  List<String> mainScreenText = [
    ' ',
    'Medxir is a Medical app',
    'Medxir is a Medical app',
  ];
  List<Color> gradientColors1 = [
    mainAppColor,
    const Color(0xffFFFFFF),
    const Color(0xffFFFFFF)
  ];
  List<Color> gradientColors2 = [
    const Color(0xffFFFFFF),
    mainAppColor,
    const Color(0xffFFFFFF)
  ];

  Widget _buildRow(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widgets,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final decorator = DotsDecorator(
      activeColor: _currentPosition == 0 ? mainAppColor : whiteColor,
      //activeColor: Colors.red,
      activeSize: const Size(30, 15),
      activeShape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index){ setState(() {
              _currentPosition = index;
              print('index $index');
              print('current position $_currentPosition');
            });
            },
              itemBuilder: (context, position ){
                return BasicOnboarding(
                  image: logos[position],
                  color1: gradientColors1[position],
                  color2: gradientColors2[position],
                  mainscreenimage: mainScreenImages[position],
                  text: mainScreenText[position],

                );
                },
              itemCount: 3,
          ),
          _currentPosition==2? Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BottomButton(text: 'Next', color:mainAppColor,buttomcolor: Colors.white,onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  const HomeScreen()));

              }, ),
            ),
          ):
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildRow([
              DotsIndicator(
                dotsCount: _totalDots,
                position: _currentPosition.toDouble(),
                decorator: decorator,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
class BasicOnboarding extends StatelessWidget {
  final image;
  final mainscreenimage;
  final color1;
  final color2;
  final text;

  BasicOnboarding({this.image, this.color1, this.color2, this.mainscreenimage,this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color1, color2],
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          Expanded(

            child: Image(image: AssetImage(image)),
          ),

          Expanded(
            flex: 4,
            child: Image(image: AssetImage(mainscreenimage)),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(text),
            ),
          ),

          const Spacer(),


        ],
      ),
    );
  }
}
class BottomButton extends StatelessWidget {
  const BottomButton({required this.text,this.onPressed,this.color,this.buttomcolor });
  final  String text;
  final  onPressed;
  final color;
  final buttomcolor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 45,
          width: 280,
          decoration:  BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
                Radius.circular(20.0)),
          ),
          child: Center(child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Text(text,style: TextStyle(color:buttomcolor,fontSize: 20,fontWeight: FontWeight.w500),),
          )),


        )

    );
  }
}