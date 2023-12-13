import 'package:desktop/bloc/simulator/simulator_bloc.dart';
import 'package:desktop/bloc/simulator/simulator_event.dart';
import 'package:desktop/components/select_base.dart';
import 'package:desktop/domains/Model/agreements_reponse_model.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/models/value_item.dart';

class Agreements extends StatelessWidget {
  final List<AgreementsModel>? listAgreements;
  final SimulatorBloc bloc;
  const Agreements(
      {super.key, required this.listAgreements, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return SelectBase(
      placeholder: 'Convênios',
      dropdownMenuEntries: listAgreements!
          .map<ValueItem>(
            (e) => ValueItem(label: e.valor!, value: e.chave!),
          )
          .toList(),
      onSelected: (value) {
        List<String> selectedValue = [];
        for (var el in value!) {
          selectedValue.add(el.value);
        }
        bloc.add(SelectConveniosEvent(listConvenios: selectedValue));
      },
    );
  }
}
