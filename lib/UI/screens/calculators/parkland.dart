import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Core/constants/colors.dart';
import 'package:project/Core/constants/veriables.dart';
import 'package:provider/provider.dart';
import '../../custom_widgets/LBMprovider.dart';
import '../../custom_widgets/custom_text_field.dart';

class Parkland extends StatelessWidget {
  const Parkland({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => lBM(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Parkland Formula'),
          backgroundColor: mainAppColor,
        ),
        body: Consumer<lBM>(builder: (context, parklandmodel, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, left: 8, right: 8),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Total Body Surface area with % Burns',
                          onchange: (value) {
                            parklandmodel.height1 = double.parse(value);
                            print('height ${parklandmodel.height1}');
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextField(
                          hintText: ' Weight in kg',
                          onchange: (value) {
                            parklandmodel.weight1 = double.parse(value);
                            print('weight ${parklandmodel.weight1}');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 200.h,
                ),
                GestureDetector(
                  onTap: () {
                    parklandmodel.parklandResult();
                    showAlertDialog(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: double.infinity,
                      child: const Center(child: Text('Calculate')),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: const Text(
      "OK",
      style: TextStyle(color: Colors.black),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))),
    backgroundColor: mainAppColor,
    content: Container(
      height: 150.h,
      child: Column(
        children: [
          Container(
              height: 20,
              color: Colors.black12,
              child: Text(
                'IV Fluid administration in 1st 24-hours ',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              )),
          // SizedBox(
          //     height: 15,
          //     child: Center(
          //       child: Text(
          //         '${parkland?.toStringAsFixed(2)}',
          //         style: TextStyle(
          //           fontSize: 15.sp,
          //           color: Colors.black,
          //           fontWeight: FontWeight.w700,
          //         ),
          //       ),
          //     )),
          const SizedBox(
            height: 30,
          ),
          Container(
              height: 20,
              color: Colors.black12,
              child: Text(
                'Half Given over first 8-hours',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              )),
          // SizedBox(
          //     height: 30,
          //     child: Center(
          //       child: Text(
          //         "${halfofparkland?.toStringAsFixed(2)}  mL \n ${per_hour_for_first_eigh_thours?.toStringAsFixed(2)} mL/hours",
          //         style: TextStyle(
          //           fontSize: 15.sp,
          //           color: Colors.black,
          //           fontWeight: FontWeight.w700,
          //         ),
          //       ),
          //     )),
          Container(
              height: 20,
              color: Colors.black12,
              child: Text(
                'Half Given over next 16-hours',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              )),
          // SizedBox(
          //     height: 30,
          //     child: Center(
          //       child: Text(
          //         "${halfofparkland?.toStringAsFixed(2)}  mL \n ${per_hour_for_first_sixteen_thours?.toStringAsFixed(2)} mL/hours",
          //         style: TextStyle(
          //           fontSize: 15.sp,
          //           color: Colors.black,
          //           fontWeight: FontWeight.w700,
          //         ),
          //       ),
          //     )),
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
