import 'package:flutter/material.dart';
import 'package:flutter_widget_catalog/core/ui/theme/app_padding.dart';
import 'package:flutter_widget_catalog/core/ui/widget/modal_sheet/page_view_category_modal_sheet.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: PageViewCategoryModalSheet)
Widget buildPageViewCategoryModalSheetUseCase(BuildContext context) {
  return Padding(padding: AppPadding.all(ratio: 2), child: PageViewCategoryModalSheet());
}
