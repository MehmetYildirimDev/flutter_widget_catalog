import 'package:flutter/material.dart';
import 'package:flutter_widget_catalog/widget/button/cool_button.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'List View With Cool Button', type: CoolButton)
Widget buildListViewCoolButtonUseCase(BuildContext context) {
  return Scaffold(body: buildBody());
}

Widget buildBody() {
  return Column(
    children: [
      Spacer(),
      Expanded(
        child: ListView.separated(
          itemCount: 30,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return Center(child: CoolButton(label: (index + 1).toString()));
          },
        ),
      ),
      Spacer(),
      CoolButton(label: "Fixed Cool Button at Bottom"),
    ],
  );
}
