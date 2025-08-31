import 'package:flutter/material.dart';

class AppSizedBox extends SizedBox {
  static const double _value = 8.0;

  const AppSizedBox({super.key, super.child, super.width, super.height});

  const AppSizedBox.square({super.key, super.child, double ratio = 1.0})
      : super(height: _value * ratio, width: _value * ratio);

  const AppSizedBox.width({super.key, double ratio = 1}) : super(width: _value * ratio, height: 0);

  const AppSizedBox.height({super.key, double ratio = 1}) : super(width: 0, height: _value * ratio);

  const AppSizedBox.expand({super.key, super.child}) : super.expand();

  const AppSizedBox.shrink({super.key, super.child}) : super.shrink();
}
