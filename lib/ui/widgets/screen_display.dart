import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scientific_calc/core/providers/math_provider.dart';
import 'package:scientific_calc/ui/uihelpers/size_config.dart';

class ScreenDisplay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenDisplayState();
  }
}

class ScreenDisplayState extends State<ScreenDisplay> {
  MathProvider _mathProvider;
  bool isExpression = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    double keyWidth = SizeConfig.screenWidth / 5;
    double keyHeight = keyWidth / 1.5;
    double displayHeight = SizeConfig.screenHeight - keyHeight * 7 - keyHeight;
    return ChangeNotifierProvider.value(
        value: _mathProvider,
        child: Consumer<MathProvider>(
            builder: (context, provider, child) => Container(
                height: displayHeight,
                child: Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal * 6),
                    child: SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _displayText(
                            _mathProvider.equation,
                            _mathProvider.isExp
                                ? SizeConfig.blockSizeHorizontal * 7
                                : SizeConfig.blockSizeHorizontal * 10),
                        _mathProvider.result != ''
                            ? _displayText(
                                _mathProvider.result.toString(),
                                _mathProvider.isExp
                                    ? SizeConfig.blockSizeHorizontal * 10
                                    : SizeConfig.blockSizeHorizontal * 7)
                            : Container(),
                      ],
                    ))))));
  }

  Widget _displayText(text, fontSize) {
    return SingleChildScrollView(
//      reverse: true,
      scrollDirection: Axis.horizontal,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
        ),
        textAlign: TextAlign.end,
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _mathProvider = Provider.of<MathProvider>(context);
  }
}
