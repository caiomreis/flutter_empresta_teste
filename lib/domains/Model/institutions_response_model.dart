class InstitutionsResponseModel {
  List<InstitutionModel>? list = [];

  InstitutionsResponseModel({
    this.list,
  });

  InstitutionsResponseModel.fromJson(List json) {
    for (var v in json) {
      list?.add(InstitutionModel.fromJson(v));
    }
  }
}

class InstitutionModel {
  String? chave;
  String? valor;

  InstitutionModel({this.chave, this.valor});

  InstitutionModel.fromJson(Map<String, dynamic> json) {
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
