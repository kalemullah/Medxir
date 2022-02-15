import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project/Core/constants/veriables.dart';


class lBM extends ChangeNotifier{
  var val=-1;
   double? height1;
   double? weight1;
  void changeValueOfRadio(Object? value){
    val= value as int;
    print('$val');
    notifyListeners();
  }
 void idealBodyWeightResult(){
   double ibw;
   val==1?ibw=50 + (0.91 * (height - 152.4)) :ibw=45.5 + (0.91 * (height - 152.4));
   IBW = ibw.toStringAsFixed(2);
   print('ideal body weight $IBW');
 }
 void bmi_bsa_resut(){
   bmi = (weight1!/height1!);
   print("bmi valeu is $bmi");
   double weight= weight1!*height1!/3600;
    weight.toStringAsFixed(2);
   bsa = sqrt(weight);
  // bsa?.;
   print('bmi ${bmi?.toStringAsFixed(2)}, bsa ${bsa?.toStringAsFixed(2)}');
   notifyListeners();
 }
  void lbmResult(){
    print(' height $height1  and weight $weight1');
    val==1?lbm=weight1!*0.32810+height1!*0.33929 -29.5336:lbm=(0.29569 *weight1!) + (0.41813*height1!) - 43.2933;
    LBM = lbm?.toStringAsFixed(2) as String;
    print('LMB $LBM');

    notifyListeners();
  }
  void parklandResult(){
     parkland = 4 * height1! *weight1!;
    print('parkland value is ${parkland?.toStringAsFixed(2)}');
    halfofparkland= (parkland!/2);
    print('half parkland value is ${halfofparkland?.toStringAsFixed(2)}');
    per_hour_for_first_eigh_thours = (halfofparkland!/8);
    per_hour_for_first_sixteen_thours =(halfofparkland!/16);

  }
}