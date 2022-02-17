class KHSModel {
  List<Khs>? khs;
  dynamic ipkSem;
  dynamic jmlSks;

  KHSModel({this.khs, this.ipkSem, this.jmlSks});

  KHSModel.fromJson(Map<String, dynamic> json) {
    if (json['Khs'] != null) {
      khs = <Khs>[];
      json['Khs'].forEach((v) {
        khs!.add(new Khs.fromJson(v));
      });
    }
    ipkSem = json['IpkSem'];
    jmlSks = json['JmlSks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.khs != null) {
      data['Khs'] = this.khs!.map((v) => v.toJson()).toList();
    }
    data['IpkSem'] = this.ipkSem;
    data['JmlSks'] = this.jmlSks;
    return data;
  }
}

class Khs {
  int? krsId;
  String? kode;
  String? namaMk;
  String? namaMkEn;
  int? jmlSks;
  String? nilai;
  String? tglKrs;

  Khs(
      {this.krsId,
      this.kode,
      this.namaMk,
      this.namaMkEn,
      this.jmlSks,
      this.nilai,
      this.tglKrs});

  Khs.fromJson(Map<String, dynamic> json) {
    krsId = json['KrsId'];
    kode = json['Kode'];
    namaMk = json['NamaMk'];
    namaMkEn = json['NamaMkEn'];
    jmlSks = json['JmlSks'];
    nilai = json['Nilai'];
    tglKrs = json['TglKrs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['KrsId'] = this.krsId;
    data['Kode'] = this.kode;
    data['NamaMk'] = this.namaMk;
    data['NamaMkEn'] = this.namaMkEn;
    data['JmlSks'] = this.jmlSks;
    data['Nilai'] = this.nilai;
    data['TglKrs'] = this.tglKrs;
    return data;
  }
}
