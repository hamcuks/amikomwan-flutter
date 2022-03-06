class DataPresensiModel {
  int? krsId;
  String? kode;
  String? namaMk;
  String? namaMkEn;
  int? jmlSks;
  int? jmlPresensiKuliah;
  int? isHadirMID;
  int? isHadirUAS;

  DataPresensiModel(
      {this.krsId,
      this.kode,
      this.namaMk,
      this.namaMkEn,
      this.jmlSks,
      this.jmlPresensiKuliah,
      this.isHadirMID,
      this.isHadirUAS});

  DataPresensiModel.fromJson(Map<String, dynamic> json) {
    krsId = json['KrsId'];
    kode = json['Kode'];
    namaMk = json['NamaMk'];
    namaMkEn = json['NamaMkEn'];
    jmlSks = json['JmlSks'];
    jmlPresensiKuliah = json['JmlPresensiKuliah'];
    isHadirMID = json['IsHadirMID'];
    isHadirUAS = json['IsHadirUAS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['KrsId'] = krsId;
    data['Kode'] = kode;
    data['NamaMk'] = namaMk;
    data['NamaMkEn'] = namaMkEn;
    data['JmlSks'] = jmlSks;
    data['JmlPresensiKuliah'] = jmlPresensiKuliah;
    data['IsHadirMID'] = isHadirMID;
    data['IsHadirUAS'] = isHadirUAS;
    return data;
  }
}
