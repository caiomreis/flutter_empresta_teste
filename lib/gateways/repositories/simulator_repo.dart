// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:desktop/domains/Model/agreements_reponse_model.dart';
import 'package:desktop/domains/Model/institutions_response_model.dart';
import 'package:desktop/domains/Model/simulator_response_model.dart';
import 'package:desktop/gateways/config/http_client.dart';

import 'package:dio/dio.dart' as dio;

class SimulatorHttpGatway extends HttpClient {
  String url = 'http://10.0.2.2:8000';
  Future<InstitutionsResponseModel> getInstituto() async {
    dio.Response response = await getHttp(
      "$url/api/instituicao",
    );
    final resp = jsonDecode(response.data);
    return InstitutionsResponseModel.fromJson(resp);
  }

  Future<AgreementsResponseModel> getConvenio() async {
    dio.Response response = await getHttp(
      "$url/api/convenio",
    );

    final resp = jsonDecode(response.data);

    return AgreementsResponseModel.fromJson(resp);
  }

  Future<SimulatorResponseModel> postSimulator({
    required double valor_emprestimo,
    required List<String> instituicoes,
    required List<String> convenios,
    required int parcela,
  }) async {
    dio.Response response = await postHttp("$url/api/simular", {
      "valor_emprestimo": valor_emprestimo,
      "instituicoes": instituicoes,
      "convenios": convenios,
      "parcela": parcela
    });
    return SimulatorResponseModel.fromJson(response.data);
  }
}
