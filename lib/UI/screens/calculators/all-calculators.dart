import 'package:flutter/material.dart';
import 'package:project/Core/constants/colors.dart';
import 'package:project/UI/custom_widgets/calculators/custom_calcultor_call.dart';
import 'package:project/UI/screens/calculators/parkland.dart';

import 'IdealBodyWeight.dart';
import 'leanBodyMass.dart';
import 'mbi_bsa_calulator.dart';

class AllCalculators extends StatelessWidget {
  const AllCalculators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculators'),
        centerTitle: true,
        backgroundColor: mainAppColor,
      ),
      body: ListView(
        children: [
          CustomCalculatorCall(
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BmiBsaCalculator(),
                ),
              );
            },
            text: const Text('BMI & BSA calculator'),
          ),
          CustomCalculatorCall(
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  LeamBodyMass(),
                ),
              );
            },
            text: const Text('Lean Body Mass'),
          ),
          CustomCalculatorCall(
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  IdealBodyWeight(),
                ),
              );
            },
            text: const Text('Ideal Body Weight'),
          ),
          CustomCalculatorCall(
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const Parkland(),
                ),
              );
            },
            text: const Text('Park land '),
          ),
        ],
      ),
    );
  }
}
