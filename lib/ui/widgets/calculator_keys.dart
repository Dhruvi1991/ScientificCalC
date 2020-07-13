import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scientific_calc/core/enums/key_type.dart';
import 'package:scientific_calc/core/providers/math_provider.dart';
import 'package:scientific_calc/core/utils/constants.dart';
import 'package:scientific_calc/ui/uihelpers/colors.dart';
import 'package:scientific_calc/ui/uihelpers/size_config.dart';

class CalculatorKeys extends StatelessWidget {
  CalculatorKeys({this.symbol});

  MathProvider _mathProvider;

  final KeySymbol symbol;

  Color get color {
    switch (symbol.type) {
      case KeyType.FUNCTION:
        return functionColor;

      case KeyType.OPERATOR:
        return operandColor;

      case KeyType.INTEGER:
      default:
        return integerColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double keyWidth = SizeConfig.screenWidth / 5;
    double keyHeight = keyWidth / 1.5;
    return Container(
        width: (symbol.toString() == ZERO) ? (keyWidth * 2) : keyWidth,
        padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 0.5),
        height: keyHeight,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.blockSizeHorizontal * 1.5)),
          color: color,
          elevation: SizeConfig.blockSizeHorizontal,
          child: Text(symbol.value,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.blockSizeHorizontal * 4.4)),
          onPressed: () {
            _mathProvider = Provider.of<MathProvider>(context, listen: false);
            _mathProvider.calculate(symbol.toString());
          },
        ));
  }
}
