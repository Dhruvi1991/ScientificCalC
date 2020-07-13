import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:scientific_calc/core/utils/constants.dart';

class MathProvider extends ChangeNotifier {
  String output = '';
  bool isResult = false;
  String firstOperand = '0';
  String secondOperand = '';
  String operators = '';
  String equation = '0';
  String expression = '';

  String get result => output;

  bool get isExp => isResult;

  void calculate(keyValue) {
    switch (keyValue) {
      case CLEAR_ALL_SIGN:
        _clear();
        notifyListeners();
        break;

      case DEL_SIGN:
        isResult = false;
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') equation = '0';
        notifyListeners();
        break;

      case EQUAL_SIGN:
        if (output == '') {
          _scientificResult();
          notifyListeners();
        }
        break;
      default:
        _scientificOperands(keyValue);
    }
  }

  void _scientificOperands(value) {
    isResult = false;
    if (value == POWER_SIGN) value = '^';
    if (value == MODULAR_SIGN) value = ' mód ';
    if (value == ARCSIN_SIGN) value = 'arcsin';
    if (value == ARCCOS_SIGN) value = 'arccos';
    if (value == ARCTAN_SIGN) value = 'arctan';
    if (value == DECIMAL_POINT_SIGN) {
      if (equation[equation.length - 1] == DECIMAL_POINT_SIGN) return;
    }
    equation == ZERO ? equation = value : equation += value;
    notifyListeners();
  }

  void _scientificResult() {
    isResult = true;
    expression = equation;
    expression = expression.replaceAll('×', '*');
    expression = expression.replaceAll('÷', '/');
    expression = expression.replaceAll(PI, '3.1415926535897932');
    expression = expression.replaceAll(E_NUM, 'e^1');
    expression = expression.replaceAll(SQUARE_ROOT_SIGN, 'sqrt');
    expression = expression.replaceAll(POWER_SIGN, '^');
    expression = expression.replaceAll(ARCSIN_SIGN, 'arcsin');
    expression = expression.replaceAll(ARCCOS_SIGN, 'arccos');
    expression = expression.replaceAll(ARCTAN_SIGN, 'arctan');
    expression = expression.replaceAll(LG_SIGN, 'log');
    expression = expression.replaceAll(' mód ', MODULAR_SIGN);
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      output = '${exp.evaluate(EvaluationType.REAL, cm)}';
      if (output == 'NaN') output = CALCULATE_ERROR;
      _isIntResult();
    } catch (e) {
      output = CALCULATE_ERROR;
    }
  }

  _isIntResult() {
    if (output.toString().endsWith(".0")) {
      output = int.parse(output.toString().replaceAll(".0", "")).toString();
    }
  }

  void _clear() {
    firstOperand = '0';
    secondOperand = '';
    operators = '';
    equation = '0';
    output = '';
    expression = '';
    isResult = false;
  }
}
