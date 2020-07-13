import 'package:flutter/material.dart';
import 'package:scientific_calc/core/enums/key_type.dart';
import 'package:scientific_calc/core/utils/constants.dart';
import 'package:scientific_calc/ui/uihelpers/size_config.dart';
import 'package:scientific_calc/ui/widgets/calculator_keys.dart';
import 'package:scientific_calc/ui/widgets/screen_display.dart';

import '../uihelpers/colors.dart';
import '../widgets/key_row.dart';

class ScientificCalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScientificCalculatorState();
  }
}

class ScientificCalculatorState extends State<ScientificCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScreenDisplay(),
            Column(
              children: calculatorKeys.map((signs) {
                return KeyRow(
                  keySymbols:
                      signs.map((keyValue) => KeySymbol(keyValue)).toList(),
                );
              }).toList(),
            )
          ]),
    );
  }
}
