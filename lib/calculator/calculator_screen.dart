import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_taxi/calculator/calculate_btn.dart';
import 'package:flutter_taxi/result/result_screen.dart';
import 'package:flutter_taxi/calculator/type.dart';
import 'package:flutter_taxi/calculator/grobgrab.dart';
import 'package:flutter_taxi/calculator/uberry.dart';
import 'package:flutter_taxi/calculator/calculator.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int carTax = 0;
  int typeIndex = 1;
  int km = 0;
  int passenger = 0;
  int kl = 501;

  void changeTypeIndex(int newTypeIndex) {
    setState(() {
      typeIndex = newTypeIndex;
    });
  }

  void changeKM(double newKM) {
    setState(() {
      km = newKM.toInt();
    });
  }

  void changePassenger(int newPassenger) {
    setState(() {
      passenger = newPassenger.toInt();
    });
  }

  void changeKL(double newKL) {
    setState(() {
      kl = newKL.toInt();
    });
  }

  void calculateButtonClick() {
    setState(() {
      if (typeIndex == 1) {
        carTax = Calculator.car(km: km, passenger: passenger);
      } else if (typeIndex == 2) {
        carTax = Calculator.van(kl);
      }

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(carTax: carTax)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Type(typeIndex: typeIndex, carTypeChange: changeTypeIndex //Code,
            ),
        (typeIndex == 1)
            ? Car(
                km: km,
                passenger: passenger,
                changeKM: changeKM,
                changePassenger: changePassenger)
            : UBerry(
                km: km,
                passenger: passenger,
                changeKM: changeKM,
                changePassenger: changePassenger),

        //Code Car Detail
        CalculateButton(
          buttonClickedFunction: calculateButtonClick,
        ),
      ],
    );
  }
}
