import 'package:flutter/material.dart';
import 'package:flutter_widget_catalog/widget/button/cool_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CoolButton)
Widget buildCoolButtonUseCase(BuildContext context) {
  return CoolButton();
}
