import 'package:desktop/components/input_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class LoanAmount extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String? value) onChange;
  final Function(String? value) onSubmit;
  const LoanAmount(
      {super.key,
      required this.textEditingController,
      required this.onChange,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return InputBase(
      autoFocus: false,
      keyboardType: TextInputType.number,
      inputFormater: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyPtBrInputFormatter()
      ],
      onChange: onChange,
      onSubmit: onSubmit,
      placeholder: 'Valor do empréstimo',
      textController: textEditingController,
    );
  }
}

class CurrencyPtBrInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    String newText = "R\$ ${formatter.format(value / 100)}";

    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}
