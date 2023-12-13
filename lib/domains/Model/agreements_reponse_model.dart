class AgreementsResponseModel {
  List<AgreementsModel>? list = [];

  AgreementsResponseModel({
    this.list,
  });

  AgreementsResponseModel.fromJson(List json) {
    for (var v in json) {
      list?.add(AgreementsModel.fromJson(v));
    }
  }
}

class AgreementsModel {
  String? chave;
  String? valor;

  AgreementsModel({this.chave, this.valor});

  AgreementsModel.fromJson(Map<String, dynamic> json) {
    chave = json['chave'];
    valor = json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chave'] = chave;
    data['valor'] = valor;
    return data;
  }
}
