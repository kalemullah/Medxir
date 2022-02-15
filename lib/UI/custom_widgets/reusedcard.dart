import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ReUsedCard extends StatelessWidget {
  final ontap;
  final text;
  final image;

  const ReUsedCard({this.ontap, this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Column(
          children: [
            SizedBox(
                height: 50.h,
                child: Image(
                  image: AssetImage(image),
                )),
            SizedBox(
              height: 30.h,
              child: Text(text,style: TextStyle(fontSize: 13.sp),),
            ),
          ],
        ),
      ),
    );
  }
}