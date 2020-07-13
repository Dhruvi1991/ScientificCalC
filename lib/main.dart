import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:scientific_calc/core/providers/math_provider.dart';
import 'file:///D:/drv/scientific_calc/lib/ui/screens/scientific_calculator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.teal),
        debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
            create: (_) => MathProvider(), child: ScientificCalculator()));
  }
}
