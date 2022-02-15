import 'package:flutter/material.dart';

class CustomCalculatorCall extends StatelessWidget {
  final ontap;
  final text;
  const CustomCalculatorCall({this.ontap,this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child:   Card(
        child: ListTile(
          leading: const Icon(Icons.arrow_forward_ios_rounded ),
          title: text,
        ),
      ),
    );
  }
}