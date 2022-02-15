import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Core/constants/colors.dart';
import 'package:project/Core/constants/veriables.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import '../../custom_widgets/LBMprovider.dart';
import '../../custom_widgets/custom_text_field.dart';

class BmiBsaCalculator extends StatelessWidget {
  const BmiBsaCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>lBM(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI & BSA calculator'),
          backgroundColor: mainAppColor,

        ),
        body:  Consumer<lBM>(
          builder: (context,model1,child){
            return SingleChildScrollView(
              child: Column(
                children:   [
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0,left: 8,right: 8),
                    child: Container(
                      height: 200,
                      decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(0, 1), // changes position of shadow
                            ),

                          ]
                      ),
                      child: Column(
                        children: [
                          CustomTextField(hintText:'enter your Height in meter',onchange: (value){
                            model1.height1=double.parse(value);
                            print('height ${model1.height1}');
                          },),
                          SizedBox(height: 20.h,),
                          CustomTextField(hintText:'enter your Weight in kg',
                            onchange: (value){
                              model1.weight1=double.parse(value);
                              print('weight ${model1.weight1}');
                            },),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 200.h,),
                  GestureDetector(
                    onTap: (){
                     model1.bmi_bsa_resut();
                      showAlertDialog(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        height: 50,
                        width: double.infinity,

                        child: const Center(child: Text('Calculate')),
                      ),
                    ),
                  )

                ],
              ),
            );
          }

        ),
      ),
    );
  }
}
showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    backgroundColor: Colors.deepPurpleAccent,
    content: Container(
      height: 150.h,
      child: Column(
        children: [
          Container(
              height: 20,
              child: Text(
                'Body Mass Index',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              )),
          SizedBox(
              height: 15,
              child: Center(
                child: Text(
                  '${bmi?.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
          const SizedBox(height: 30,),
          Container(
              height: 20,
              child: Text(
                'Body Surface Area ',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              )),

          SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  "${bsa?.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ))

        ],
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



