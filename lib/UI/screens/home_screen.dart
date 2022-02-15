import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/Core/constants/colors.dart';
import 'package:project/UI/custom_widgets/custom_text_field.dart';
import 'package:project/UI/custom_widgets/reusedcard.dart';

import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'calculators/all-calculators.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton( icon: Icon(Icons.account_circle),
              onPressed:  () {
                Scaffold.of(context).openDrawer();
              },);
          },

        ),

        title: const Text('Medxir'),
        centerTitle: true,
        backgroundColor: mainAppColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: Padding(
            padding: EdgeInsets.all(15.r),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(2, 2), // changes position of shadow
                    ),

                  ]
              ),
              height: 60.h,
              child: const Center(
                child: costumTextField(),
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.only(bottom: 30.h),
                decoration:  BoxDecoration(
                  color: mainAppColor,
                ),
                child: Padding(
                  padding:  EdgeInsets.only(top: 90.h,),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Icon(
                          Icons.account_circle, color: Colors.white, size: 40,),
                        flex: 2,
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Kaleem Ullah",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
            ),
           const ListTile(
             leading:  Icon(Icons.account_box ),
        title: Text('My Profile'),
           ),
            const ListTile(
              leading:  Icon(Icons.comment ),
              title: Text('Saved Content'),
            ),
            const ListTile(
              leading:  Icon(Icons.email ),
              title: Text('MY Invitations'),
            ),
           const ListTile(
             leading:  Icon(Icons.settings ),
        title: Text('Settings'),
           ),
          ],
        ),
      ),
      body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 178.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(
                              0, 1), // changes position of shadow
                        ),

                      ]
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 10.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: ReUsedCard(
                                ontap: () {},
                                text: 'Drugs',
                                image: 'assets/pill1.png',
                              ),
                            ),
                            Expanded(
                              child: ReUsedCard(
                                ontap: () {},
                                text: 'Interaction \n checker',
                                image: 'assets/intraction.png',
                              ),
                            ),
                            Expanded(
                              child: ReUsedCard(
                                ontap: () {},
                                text: 'Conditions',
                                image: 'assets/condition.png',
                              ),
                            ),
                            Expanded(
                              child: ReUsedCard(
                                ontap: () {},
                                text: 'procedures',
                                image: 'assets/procedures1.png',
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 7.h),
                        child: Row(
                          children: [
                            Expanded(
                              child: ReUsedCard(
                                ontap: () {},
                                text: 'Decision Point',
                                image: 'assets/decision.png',
                              ),
                            ),
                            Expanded(
                              child: ReUsedCard(
                                ontap: () {
                                  Navigator
                                      .push(context, MaterialPageRoute(builder: (context)
                                  =>
                                  const AllCalculators()
                                  ),);
                                },
                                text: 'Calculator',
                                image: 'assets/calculator.png',
                              ),
                            ),
                            Expanded(
                              child: ReUsedCard(
                                ontap: () {},
                                text: 'Pill identifier',
                                image: 'assets/searchpill.png',
                              ),
                            ),
                            Expanded(
                              child: ReUsedCard(
                                ontap: () {},
                                text: 'More',
                                image: 'assets/more.png',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),

            SingleChildScrollView(
              child: SizedBox(
                height: 305.h,
                child: const WebView(
                  initialUrl: 'https://www.webmd.com/',
                ),
              ),
            )
          ]
      ),

    );
  }
}


