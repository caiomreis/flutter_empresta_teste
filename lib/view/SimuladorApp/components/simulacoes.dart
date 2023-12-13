import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class Simulacoes extends StatelessWidget {
  final double taxa;
  final int parcelas;
  final double valorParcela;
  final String convenio;
  final String instituicao;

  const Simulacoes({
    super.key,
    required this.taxa,
    required this.parcelas,
    required this.valorParcela,
    required this.convenio,
    required this.instituicao,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 194, 188, 188),
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${UtilBrasilFields.obterReal(valorParcela)}  *  $parcelas x ${UtilBrasilFields.obterReal(valorParcela / parcelas)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '$instituicao ($convenio)  *  $taxa%',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
