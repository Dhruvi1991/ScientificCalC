import 'package:scientific_calc/core/utils/constants.dart';

enum KeyType { FUNCTION, OPERATOR, INTEGER }

class KeySymbol {
  const KeySymbol(this.value);

  final String value;

  static List<String> _functions = [
    LG_SIGN,
    LN_SIGN,
    ARCSIN_SIGN,
    ARCCOS_SIGN,
    ARCTAN_SIGN,
    LEFT_QUOTE_SIGN,
    RIGHT_QUOTE_SIGN,
    SIN_SIGN,
    COS_SIGN,
    TAN_SIGN,
    LN2_SIGN,
    CLEAR_ALL_SIGN,
    DEL_SIGN,
    MODULAR_SIGN,
    DIVISION_SIGN,
    POWER_SIGN,
    MULTIPLICATION_SIGN,
    SQUARE_ROOT_SIGN,
    MINUS_SIGN,
    PI,
    PLUS_SIGN,
    E_NUM,
    DECIMAL_POINT_SIGN
  ];
  static List<String> _equal_operator = [EQUAL_SIGN];

  @override
  String toString() => value;

  bool get isOperator => _equal_operator.contains(this.toString());

  bool get isFunction => _functions.contains(this.toString());

  bool get isInteger => !isOperator && !isFunction;

  KeyType get type => isFunction
      ? KeyType.FUNCTION
      : (isOperator ? KeyType.OPERATOR : KeyType.INTEGER);
}
