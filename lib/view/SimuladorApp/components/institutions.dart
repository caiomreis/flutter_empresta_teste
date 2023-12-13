import 'package:desktop/bloc/simulator/simulator_bloc.dart';
import 'package:desktop/bloc/simulator/simulator_event.dart';
import 'package:desktop/components/select_base.dart';
import 'package:desktop/domains/Model/institutions_response_model.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/models/value_item.dart';

class Institutions extends StatelessWidget {
  final List<InstitutionModel>? listInstitutions;
  final SimulatorBloc bloc;
  const Institutions({
    super.key,
    required this.listInstitutions,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return SelectBase(
      placeholder: 'Instituições',
      dropdownMenuEntries: listInstitutions!
          .map<ValueItem>(
            (e) => ValueItem(label: e.valor!, value: e.chave!),
          )
          .toList(),
      onSelected: (value) {
        List<String> selectedValue = [];
        for (var el in value!) {
          selectedValue.add(el.value);
        }
        bloc.add(SelectInstituicoesEvent(listInstituicoes: selectedValue));
      },
    );
  }
}
