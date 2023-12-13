class SimulatorResponseModel {
  List<INFOS>? bmg;
  List<INFOS>? pan;
  List<INFOS>? ole;

  SimulatorResponseModel({this.bmg, this.pan, this.ole});

  SimulatorResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['BMG'] != null) {
      bmg = <INFOS>[];
      json['BMG'].forEach((v) {
        bmg!.add(INFOS.fromJson(v));
      });
    }
    if (json['PAN'] != null) {
      pan = <INFOS>[];
      json['PAN'].forEach((v) {
        pan!.add(INFOS.fromJson(v));
      });
    }
    if (json['OLE'] != null) {
      ole = <INFOS>[];
      json['OLE'].forEach((v) {
        ole!.add(INFOS.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bmg != null) {
      data['BMG'] = bmg!.map((v) => v.toJson()).toList();
    }
    if (pan != null) {
      data['PAN'] = pan!.map((v) => v.toJson()).toList();
    }
    if (ole != null) {
      data['OLE'] = ole!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class INFOS {
  double? taxa;
  int? parcelas;
  double? valorParcela;
  String? convenio;

  INFOS({this.taxa, this.parcelas, this.valorParcela, this.convenio});

  INFOS.fromJson(Map<String, dynamic> json) {
    taxa = json['taxa'];
    parcelas = json['parcelas'];
    valorParcela = json['valor_parcela'];
    convenio = json['convenio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['taxa'] = taxa;
    data['parcelas'] = parcelas;
    data['valor_parcela'] = valorParcela;
    data['convenio'] = convenio;
    return data;
  }
}
