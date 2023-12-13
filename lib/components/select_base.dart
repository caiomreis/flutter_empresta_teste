import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class SelectBase extends StatelessWidget {
  final String placeholder;
  final Function(List<ValueItem>?) onSelected;
  final List<ValueItem<Object?>> dropdownMenuEntries;
  final TextStyle? textStyle;
  final SelectionType? selectionType;

  const SelectBase({
    super.key,
    required this.placeholder,
    required this.onSelected,
    required this.dropdownMenuEntries,
    this.selectionType,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        child: MultiSelectDropDown(
          selectedOptionTextColor: Colors.white12,
          hint: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          onOptionSelected: onSelected,
          focusedBorderColor: HexColor('#ff9800'),
          optionTextStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: HexColor('#323130'),
          ),
          hintColor: HexColor('#323130'),
          options: [...dropdownMenuEntries],
          selectionType: selectionType ?? SelectionType.multi,
          borderColor: HexColor('#323130'),
          hintFontSize: 16,
          borderRadius: 8,
          borderWidth: 1,
          focusedBorderWidth: 1,
          selectedOptionBackgroundColor: Colors.white,
          optionsBackgroundColor: Colors.white,
          selectedOptionIcon: Icon(
            Icons.check,
            color: HexColor('#ff9800'),
          ),
          chipConfig: ChipConfig(backgroundColor: HexColor('#ff9800')),
        ),
      ),
    );
  }
}
