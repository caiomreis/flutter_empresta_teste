import 'package:desktop/bloc/simulator/simulator_bloc.dart';
import 'package:desktop/bloc/simulator/simulator_event.dart';
import 'package:desktop/components/select_base.dart';
import 'package:desktop/domains/enum/installments_enum.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/enum/app_enums.dart';
import 'package:multi_dropdown/models/value_item.dart';

class Installments extends StatelessWidget {
  final SimulatorBloc? bloc;
  const Installments({super.key, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return SelectBase(
      placeholder: 'Quantidade de parcelas',
      selectionType: SelectionType.single,
      dropdownMenuEntries: InstallmentsEnum.values
          .map<ValueItem>(
            (e) => ValueItem(label: e.label, value: e.parce),
          )
          .toList(),
      onSelected: (v) {
        bool isEmpatyValue = true;
        v?.forEach((el) {
          bloc!.add(SelectParcelasEvent(parcelas: el.value));
          isEmpatyValue = false;
        });

        if (isEmpatyValue) bloc!.add(SelectParcelasEvent(parcelas: 0));
      },
    );
  }
}
