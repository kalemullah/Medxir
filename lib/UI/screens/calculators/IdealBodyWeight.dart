import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project/Core/constants/colors.dart';
import 'package:project/Core/constants/veriables.dart';
import 'package:provider/provider.dart';
import '../../custom_widgets/LBMprovider.dart';
import '../../custom_widgets/custom_text_field.dart';

class IdealBodyWeight extends StatelessWidget {

  int val = -1;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>lBM(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Ideal Boy Weight calculator'),
          backgroundColor: mainAppColor,
        ),
        body: Consumer<lBM>(
          builder: (context,model,child)
        {
         return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(1),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 1), // changes position of shadow
                        ),
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12),
                    child: Center(
                        child: Text(
                          'Ideal body weight is the optimal weight associated with maximum life expectancy for a given height.',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
                ListTile(
                  title: Text("Male"),
                  leading: Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                     model.changeValueOfRadio(value);
                    },
                    activeColor: Colors.green,
                  ),
                ),
                ListTile(
                  title: const Text("Female"),
                  leading: Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: ( value) {
                      model.changeValueOfRadio(value);
                    },
                    activeColor: Colors.green,
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 8, right: 8),
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(1),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: const Offset(0, 1), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'enter your Height in centimeter',
                          onchange: (value) {
                            model.height1 = double.parse(value);
                            print("height ${model.height1}");
                          },
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 120.h,
                ),
                GestureDetector(
                  onTap: () {
                     model.idealBodyWeightResult();
                      showAlertDialog(context,IBW!);

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red, borderRadius: BorderRadius.circular(15)),
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
showAlertDialog(BuildContext context, String IBW) {
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
                'Lean Body Mass is',
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
                  IBW,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
          const SizedBox(
            height: 30,
          ),

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

