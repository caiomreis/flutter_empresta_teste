import 'package:desktop/bloc/simulator/simulator_event.dart';
import 'package:desktop/bloc/simulator/simulator_state.dart';
import 'package:desktop/domains/Model/agreements_reponse_model.dart';
import 'package:desktop/domains/Model/institutions_response_model.dart';
import 'package:desktop/domains/Model/simulator_response_model.dart';
import 'package:desktop/gateways/repositories/simulator_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimulatorBloc extends Bloc<SimulatorEvent, SimulatorState> {
  final SimulatorHttpGatway _simulatorHttpGatway = SimulatorHttpGatway();

  SimulatorBloc() : super(SimulatorState.inital()) {
    on<GetInstituicoes>(
      (event, emit) async => emit(await _getInstituicoes(emit)),
    );
    on<GetConvenios>(
      (event, emit) async => emit(await _getConvenios(emit)),
    );
    on<SelectValorEvent>(
      (event, emit) => emit(state.copyWith(valorDoEmprestimo: event.valor)),
    );
    on<SelectParcelasEvent>(
      (event, emit) => emit(state.copyWith(parcelas: event.parcelas)),
    );
    on<SelectInstituicoesEvent>(
      (event, emit) =>
          emit(state.copyWith(listInstituicoes: event.listInstituicoes)),
    );
    on<SelectConveniosEvent>(
      (event, emit) => emit(state.copyWith(listConvenios: event.listConvenios)),
    );
    on<PostSimulacao>(
      (event, emit) async => emit(await _postSimulacao(emit)),
    );
  }

  Future<SimulatorState> _getInstituicoes(
    Emitter<SimulatorState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    List<InstitutionModel> list = [];

    try {
      InstitutionsResponseModel response =
          await _simulatorHttpGatway.getInstituto();
      list.addAll(response.list!);
      return state.copyWith(listInstitutions: list);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return state.copyWith(loading: false);
    }
  }

  Future<SimulatorState> _getConvenios(
    Emitter<SimulatorState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    List<AgreementsModel> list = [];

    try {
      AgreementsResponseModel response =
          await _simulatorHttpGatway.getConvenio();
      list.addAll(response.list!);

      return state.copyWith(listAgreements: list, loading: false);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return state.copyWith(loading: false);
    }
  }

  Future<SimulatorState> _postSimulacao(
    Emitter<SimulatorState> emit,
  ) async {
    emit(state.copyWith(
      loadingSimulacao: true,
    ));
    try {
      SimulatorResponseModel response =
          await _simulatorHttpGatway.postSimulator(
        convenios: state.listConvenios!,
        instituicoes: state.listInstituicoes!,
        parcela: state.parcelas!,
        valor_emprestimo: state.valorDoEmprestimo!,
      );
      return state.copyWith(
        loadingSimulacao: false,
        bmg: response.bmg ?? [],
        ole: response.ole ?? [],
        pan: response.pan ?? [],
        dontFind: hasEmprestimos(response),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return state.copyWith(loading: false);
    }
  }

  bool hasEmprestimos(SimulatorResponseModel response) {
    return response.ole == null && response.pan == null && response.bmg == null;
  }
}
