import 'package:desktop/domains/Model/simulator_response_model.dart';
import 'package:desktop/view/SimuladorApp/components/simulacoes.dart';
import 'package:flutter/material.dart';

class ListSimulacoes extends StatelessWidget {
  final List<INFOS>? bmg;
  final List<INFOS>? pan;
  final List<INFOS>? ole;
  final bool? dontFind;

  const ListSimulacoes({
    super.key,
    required this.bmg,
    required this.pan,
    required this.ole,
    required this.dontFind,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          if (bmg != null)
            ...bmg!.map((e) => Simulacoes(
                  instituicao: 'BMG',
                  convenio: e.convenio!,
                  parcelas: e.parcelas!,
                  taxa: e.taxa!,
                  valorParcela: e.valorParcela!,
                )),
          if (pan != null)
            ...pan!.map((e) => Simulacoes(
                  instituicao: 'PAN',
                  convenio: e.convenio!,
                  parcelas: e.parcelas!,
                  taxa: e.taxa!,
                  valorParcela: e.valorParcela!,
                )),
          if (ole != null)
            ...ole!.map((e) => Simulacoes(
                  instituicao: 'OLE',
                  convenio: e.convenio!,
                  parcelas: e.parcelas!,
                  taxa: e.taxa!,
                  valorParcela: e.valorParcela!,
                )),
          if (dontFind!)
            Container(
              alignment: Alignment.center,
              height: 150,
              child: const Text(
                'Ops! Não temos emprestimos para as opções selecionadas!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
        ],
      ),
    );
  }
}
