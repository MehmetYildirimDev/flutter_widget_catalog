// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_workspace/widget/button/cool_button.dart'
    as _widgetbook_workspace_widget_button_cool_button;
import 'package:widgetbook_workspace/widget/button/list_view_with_cool_button.dart'
    as _widgetbook_workspace_widget_button_list_view_with_cool_button;
import 'package:widgetbook_workspace/widget/modal_sheet/page_view_category_modal_sheet.dart'
    as _widgetbook_workspace_widget_modal_sheet_page_view_category_modal_sheet;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'core',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'ui',
        children: [
          _widgetbook.WidgetbookFolder(
            name: 'widget',
            children: [
              _widgetbook.WidgetbookFolder(
                name: 'button',
                children: [
                  _widgetbook.WidgetbookComponent(
                    name: 'CoolButton',
                    useCases: [
                      _widgetbook.WidgetbookUseCase(
                        name: 'Default',
                        builder:
                            _widgetbook_workspace_widget_button_cool_button
                                .buildCoolButtonUseCase,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'Editable Title',
                        builder:
                            _widgetbook_workspace_widget_button_cool_button
                                .buildEditableTitleCoolButtonUseCase,
                      ),
                      _widgetbook.WidgetbookUseCase(
                        name: 'List View With Cool Button',
                        builder:
                            _widgetbook_workspace_widget_button_list_view_with_cool_button
                                .buildListViewCoolButtonUseCase,
                      ),
                    ],
                  ),
                ],
              ),
              _widgetbook.WidgetbookFolder(
                name: 'modal_sheet',
                children: [
                  _widgetbook.WidgetbookLeafComponent(
                    name: 'PageViewCategoryModalSheet',
                    useCase: _widgetbook.WidgetbookUseCase(
                      name: 'Default',
                      builder:
                          _widgetbook_workspace_widget_modal_sheet_page_view_category_modal_sheet
                              .buildPageViewCategoryModalSheetUseCase,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];
