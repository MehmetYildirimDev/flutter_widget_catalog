import 'package:flutter/material.dart';
import 'package:flutter_widget_catalog/core/ui/widget/button/cool_button.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: CoolButton)
Widget buildCoolButtonUseCase(BuildContext context) {
  return CoolButton();
}

@widgetbook.UseCase(name: 'Editable Title', type: CoolButton)
Widget buildEditableTitleCoolButtonUseCase(BuildContext context) {
  return CoolButton(
    label: context.knobs.string(
      label: 'Title Label',
      initialValue: 'Editable Title',
      description: 'The label displayed on the CoolButton',
    ),
  );
}
