import 'package:flutter/material.dart';
import 'package:scientific_calc/core/enums/key_type.dart';
import 'package:scientific_calc/ui/widgets/calculator_keys.dart';

class KeyRow extends StatelessWidget{
  KeyRow({@required this.keySymbols});

  final List<KeySymbol> keySymbols;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: keys(),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  List<Widget> keys() {
    List<Widget> keys = [];
    keySymbols.forEach((KeySymbol keyText) {
      keys.add(
        CalculatorKeys(
          symbol: keyText
        ),
      );
    });
    return keys;
  }
}