import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Core/constants/colors.dart';
class costumTextField extends StatelessWidget {
  const costumTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: const TextField(
        cursorColor:blackColor,
        decoration: InputDecoration(
          icon:  Icon(Icons.search,color: blackColor,),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: 'Enter a search term',
        ),
      ),
    );
  }
}
class CustomTextField extends StatelessWidget {
  final hintText;
  final onchange;

  CustomTextField({this.hintText, this.onchange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: onchange,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder:
          UnderlineInputBorder(borderRadius: BorderRadius.circular(20.r)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: const BorderSide(color: Colors.white)),
          filled: true,
          fillColor: textFieldColor,
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 30.w),
        ),
      ),
    );
  }
}
