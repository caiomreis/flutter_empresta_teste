import 'package:desktop/domains/Model/agreements_reponse_model.dart';
import 'package:desktop/domains/Model/institutions_response_model.dart';
import 'package:desktop/domains/Model/simulator_response_model.dart';
import 'package:equatable/equatable.dart';

class SimulatorState extends Equatable {
  final bool? loading;
  final bool? loadingSimulacao;
  final List<AgreementsModel>? listAgreements;
  final List<InstitutionModel>? listInstitutions;
  final int? parcelas;
  final List<String>? listInstituicoes;
  final List<String>? listConvenios;
  final double? valorDoEmprestimo;
  final List<INFOS>? bmg;
  final List<INFOS>? pan;
  final List<INFOS>? ole;
  final bool? dontFind;
  const SimulatorState({
    this.loading,
    this.loadingSimulacao,
    this.listAgreements,
    this.listInstitutions,
    this.parcelas,
    this.listInstituicoes,
    this.listConvenios,
    this.valorDoEmprestimo,
    this.bmg,
    this.pan,
    this.ole,
    this.dontFind,
  });

  factory SimulatorState.inital() {
    return const SimulatorState(
      dontFind: false,
      loading: true,
      loadingSimulacao: false,
      parcelas: 0,
      listInstituicoes: [],
      listConvenios: [],
      bmg: [],
      pan: [],
      ole: [],
    );
  }

  SimulatorState copyWith({
    bool? loading,
    bool? loadingSimulacao,
    List<AgreementsModel>? listAgreements,
    List<InstitutionModel>? listInstitutions,
    int? parcelas,
    List<String>? listInstituicoes,
    List<String>? listConvenios,
    double? valorDoEmprestimo,
    List<INFOS>? bmg,
    List<INFOS>? pan,
    List<INFOS>? ole,
    bool? dontFind,
  }) {
    return SimulatorState(
      loading: loading ?? this.loading,
      listAgreements: listAgreements ?? this.listAgreements,
      listInstitutions: listInstitutions ?? this.listInstitutions,
      parcelas: parcelas ?? this.parcelas,
      listInstituicoes: listInstituicoes ?? this.listInstituicoes,
      listConvenios: listConvenios ?? this.listConvenios,
      valorDoEmprestimo: valorDoEmprestimo ?? this.valorDoEmprestimo,
      loadingSimulacao: loadingSimulacao ?? this.loadingSimulacao,
      bmg: bmg ?? this.bmg,
      pan: pan ?? this.pan,
      ole: ole ?? this.ole,
      dontFind: dontFind ?? this.dontFind,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        listAgreements,
        listInstitutions,
        parcelas,
        listInstituicoes,
        listConvenios,
        valorDoEmprestimo,
        loadingSimulacao,
        dontFind,
      ];
}
