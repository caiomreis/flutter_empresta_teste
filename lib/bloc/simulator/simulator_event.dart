abstract class SimulatorEvent {}

class GetConvenios extends SimulatorEvent {
  GetConvenios();
}

class GetInstituicoes extends SimulatorEvent {
  GetInstituicoes();
}

class SelectValorEvent extends SimulatorEvent {
  final double? valor;
  SelectValorEvent({this.valor});
}

class SelectParcelasEvent extends SimulatorEvent {
  final int? parcelas;
  SelectParcelasEvent({this.parcelas});
}

class SelectInstituicoesEvent extends SimulatorEvent {
  final List<String>? listInstituicoes;
  SelectInstituicoesEvent({this.listInstituicoes});
}

class SelectConveniosEvent extends SimulatorEvent {
  final List<String>? listConvenios;
  SelectConveniosEvent({this.listConvenios});
}

class PostSimulacao extends SimulatorEvent {
  PostSimulacao();
}
