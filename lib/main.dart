import 'package:flutter/material.dart';
import 'package:project/UI/screens/splashscreen.dart';
import 'UI/screens/home_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData(size: Size(360,690)),
      child: ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => const MaterialApp(
          home: SplashScreen(),
        ),
      ),
    );
  }
}
