import 'package:flutter/material.dart';

class AppPadding extends EdgeInsets {
  static const double _value = 8.0;

  const AppPadding.none() : super.only();

  const AppPadding.all({double ratio = 1}) : super.all((_value * ratio));

  const AppPadding.onlyTop({double ratio = 1}) : super.only(top: (_value * ratio));

  const AppPadding.onlyLeft({double ratio = 1}) : super.only(left: (_value * ratio));

  const AppPadding.onlyRight({double ratio = 1}) : super.only(right: (_value * ratio));

  const AppPadding.onlyBottom({double ratio = 1}) : super.only(bottom: (_value * ratio));

  const AppPadding.verticalSymmetric({double ratio = 1}) : super.symmetric(vertical: (_value * ratio));

  const AppPadding.horizontalSymmetric({double ratio = 1}) : super.symmetric(horizontal: (_value * ratio));

  const AppPadding.symmetric({double verticalRatio = 1, double horizontalRatio = 1})
      : super.symmetric(horizontal: (_value * horizontalRatio), vertical: (_value * verticalRatio));

  const AppPadding.only({double topRatio = 0, double bottomRatio = 0, double leftRatio = 0, double rightRatio = 0})
      : super.only(
            top: (_value * topRatio),
            bottom: (_value * bottomRatio),
            left: (_value * leftRatio),
            right: (_value * rightRatio));
}
