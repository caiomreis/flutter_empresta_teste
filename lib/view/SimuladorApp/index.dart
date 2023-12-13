// ignore_for_file: library_private_types_in_public_api, unrelated_type_equality_checks

import 'package:brasil_fields/brasil_fields.dart';
import 'package:desktop/bloc/simulator/simulator_bloc.dart';
import 'package:desktop/bloc/simulator/simulator_event.dart';
import 'package:desktop/bloc/simulator/simulator_state.dart';
import 'package:desktop/components/button.dart';
import 'package:desktop/view/SimuladorApp/components/agreements.dart';
import 'package:desktop/view/SimuladorApp/components/installments.dart';
import 'package:desktop/view/SimuladorApp/components/institutions.dart';
import 'package:desktop/view/SimuladorApp/components/list_simulacoes.dart';
import 'package:desktop/view/SimuladorApp/components/loan_amount.dart';
import 'package:desktop/view/SimuladorApp/components/skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class SimulatorApp extends StatefulWidget {
  const SimulatorApp({super.key});

  @override
  _SimulatorApp createState() => _SimulatorApp();
}

class _SimulatorApp extends State<SimulatorApp> {
  late final SimulatorBloc? _bloc;
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _bloc = SimulatorBloc();
    _bloc?.add(GetInstituicoes());
    _bloc?.add(GetConvenios());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#ff9800'),
        title: const Text('Simulador App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<SimulatorBloc, SimulatorState>(
            bloc: _bloc,
            builder: (context, state) {
              return state.loading!
                  ? const SkeletonSimulador()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        LoanAmount(
                          textEditingController: textEditingController,
                          onChange: (String? value) {
                            double? valor = value!.isEmpty
                                ? null
                                : UtilBrasilFields.converterMoedaParaDouble(
                                    value);

                            _bloc?.add(
                              SelectValorEvent(valor: valor),
                            );
                          },
                          onSubmit: (String? value) {
                            double? valor = value!.isEmpty
                                ? null
                                : UtilBrasilFields.converterMoedaParaDouble(
                                    value);

                            _bloc?.add(
                              SelectValorEvent(valor: valor),
                            );
                          },
                        ),
                        const SizedBox(height: 14),
                        Installments(
                          bloc: _bloc!,
                        ),
                        const SizedBox(height: 14),
                        Institutions(
                          bloc: _bloc!,
                          listInstitutions: state.listInstitutions,
                        ),
                        const SizedBox(height: 14),
                        Agreements(
                          bloc: _bloc!,
                          listAgreements: state.listAgreements,
                        ),
                        const SizedBox(height: 14),
                        SimulatorButton(
                          disable: state.valorDoEmprestimo == 0.0 ||
                              state.valorDoEmprestimo == null,
                          text: 'SIMULAR',
                          isLoading: state.loadingSimulacao,
                          onPress: () {
                            _bloc?.add(PostSimulacao());
                          },
                        ),
                        Expanded(
                          child: ListSimulacoes(
                            bmg: state.bmg,
                            ole: state.ole,
                            pan: state.pan,
                            dontFind: state.dontFind,
                          ),
                        )
                      ],
                    );
            }),
      ),
    );
  }
}
