import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_catalog/core/ui/theme/animation_constants.dart';
import 'package:flutter_widget_catalog/core/ui/theme/app_padding.dart';
import 'package:flutter_widget_catalog/core/ui/theme/app_spacing.dart';
import 'package:flutter_widget_catalog/core/ui/theme/color_palette.dart';
import 'package:flutter_widget_catalog/core/ui/theme/sized_box.dart';

class PageViewCategoryModalSheet extends StatefulWidget {
  const PageViewCategoryModalSheet({super.key});

  @override
  State<PageViewCategoryModalSheet> createState() => _PageViewCategoryModalSheetState();
}

class _PageViewCategoryModalSheetState extends State<PageViewCategoryModalSheet> {
  late final PageController _pageController;
  int _currentPageIndex = 0;

  late final TextEditingController _searchController;
  String _searchQuery = '';

  //TODO: add highlight text onSearch

  final List<int> integerList = List.generate(20, (index) => index);
  final List<int> selectedIntegers = [];

  final List<String> stringList = List.generate(20, (index) => 'Item $index');
  final List<String> selectedStrings = [];

  Type _selectedAssigneeType = int;

  List<dynamic> _filteredItems = [];

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _searchController = TextEditingController();

    _searchController.addListener(_onSearchChanged);
    _updateFilteredItems();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text;
      _updateFilteredItems();
    });
  }

  void _updateFilteredItems() {
    final sourceList = _selectedAssigneeType == int ? integerList : stringList;

    if (_searchQuery.isEmpty) {
      _filteredItems = List<dynamic>.from(sourceList);
    } else {
      _filteredItems = sourceList
          .where((item) => item.toString().toLowerCase().contains(_searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.regular,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTopBar(context),
        Flexible(child: _buildPageView()),
      ],
    );
  }

  Row _buildTopBar(BuildContext context) =>
      _currentPageIndex == 0 ? _buildCategoryTopBarRow(context) : _buildItemTopBarRow(context);

  Row _buildCategoryTopBarRow(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Select Category"), _closeButton],
    );
  }

  Row _buildItemTopBarRow(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        IconButton(
          onPressed: () {
            _pageController.previousPage(duration: AnimationConstants.defaultDuration, curve: Curves.easeInOut);
          },
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        const AppSizedBox.width(ratio: 0.5),
        Text("Select Type"),
        Spacer(),
        _closeButton,
      ],
    );
  }

  IconButton get _closeButton => IconButton(onPressed: () {}, icon: const Icon(Icons.close, size: 24));

  PageView _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (value) {
        setState(() => _currentPageIndex = value);

        if (value == 0) {
          _searchController.clear();
          _searchQuery = '';
        }
        _updateFilteredItems();
      },
      physics: const NeverScrollableScrollPhysics(),
      children: [_selectAssigneeTypeView(), _buildAssignableListView()],
    );
  }

  _selectAssigneeTypeView() {
    return Column(
      children: [
        selectAssigneeTypeButton(
          title: "int",
          onPressed: () {
            FocusScope.of(context).unfocus();

            setState(() => _selectedAssigneeType = int);

            _pageController.nextPage(duration: AnimationConstants.defaultDuration, curve: Curves.easeInOut);
          },
          length: integerList.length,
          icon: Icon(Icons.person, size: 24),
        ),
        selectAssigneeTypeButton(
          title: "String",
          onPressed: () {
            FocusScope.of(context).unfocus();

            setState(() => _selectedAssigneeType = String);

            _pageController.nextPage(duration: AnimationConstants.defaultDuration, curve: Curves.easeInOut);
          },
          length: stringList.length,
          icon: Icon(Icons.supervised_user_circle_outlined),
        ),
      ],
    );
  }

  selectAssigneeTypeButton({
    required String title,
    required VoidCallback onPressed,
    required int length,
    required Widget icon,
  }) {
    return ElevatedButton(
      style: _assigneeTypeButtonStyle,
      onPressed: onPressed,
      child: Row(
        children: [
          icon,
          const AppSizedBox.width(ratio: 2),
          Text(title),
          Spacer(),
          Text("($length)"),
          const AppSizedBox.width(ratio: 2),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget _buildAssignableListView() {
    return Padding(
      padding: AppPadding.verticalSymmetric(ratio: 0.5),
      child: Column(
        spacing: AppSpacing.regular,
        children: [
          // SearchFormField(_searchController), //TODO: uncomment when SearchFormField is ready
          Expanded(child: _buildListView()),
        ],
      ),
    );
  }

  Widget _buildListView() {
    final items = _searchQuery.isNotEmpty ? _filteredItems : (_selectedAssigneeType == int ? integerList : stringList);

    if (items.isEmpty && _searchQuery.isNotEmpty) {
      return Text("No found");
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildAssignableItem(context, items[index]);
      },
    );
  }

  Widget _buildAssignableItem(BuildContext context, dynamic item) {
    final bool isSelected = _selectedAssigneeType == int
        ? selectedIntegers.any((element) => element == item)
        : selectedStrings.any((element) => element == item);

    return ElevatedButton(
      style: _itemButtonStyle,
      onPressed: () {
        _onItemTap(isSelected, item);
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          AppSizedBox.square(ratio: 4.5, child: _buildCheckBox(item, isSelected)),
          Expanded(child: Text(item.toString())),
        ],
      ),
    );
  }

  Widget _buildCheckBox(dynamic item, bool isSelected) => Transform.scale(
    scale: 1.3,
    child: CupertinoCheckbox(
      value: isSelected,
      checkColor: _checkColor,
      side: _side,
      fillColor: _fillColor,
      onChanged: (value) {
        _onItemTap(isSelected, item);
      },
    ),
  );

  Color get _checkColor => ColorPalette.white;

  WidgetStateBorderSide get _side {
    return WidgetStateBorderSide.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return BorderSide(width: 1, color: ColorPalette.transparent);
      }
      return BorderSide(width: 1, color: ColorPalette.onSurfaceLight);
    });
  }

  WidgetStateProperty<Color?> get _fillColor {
    return WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return ColorPalette.onSurfaceLight;
      } else if (states.contains(WidgetState.selected)) {
        return ColorPalette.primary;
      }
      return ColorPalette.transparent;
    });
  }

  void _onItemTap(bool isSelected, dynamic item) {
    setState(() {
      if (_selectedAssigneeType == int) {
        if (isSelected) {
          selectedIntegers.remove(item);
        } else {
          selectedIntegers.add(item as int);
        }
      } else {
        if (isSelected) {
          selectedStrings.remove(item);
        } else {
          selectedStrings.add(item as String);
        }
      }
    });
  }

  ButtonStyle get _itemButtonStyle {
    return ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 24),
      padding: AppPadding.none(),
      alignment: Alignment.centerLeft,
      backgroundColor: ColorPalette.transparent,
      shadowColor: ColorPalette.transparent,
      foregroundColor: ColorPalette.onSurfaceLight,
      shape: RoundedRectangleBorder(),
    );
  }

  ButtonStyle get _assigneeTypeButtonStyle {
    return ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 48),
      padding: AppPadding.none(),
      alignment: Alignment.centerLeft,
      backgroundColor: ColorPalette.transparent,
      shadowColor: ColorPalette.transparent,
      foregroundColor: ColorPalette.primary,
      shape: RoundedRectangleBorder(),
    );
  }
}
