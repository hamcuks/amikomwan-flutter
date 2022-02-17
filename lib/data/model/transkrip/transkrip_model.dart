class TranskripModel {
  List<Transkrip>? transkrip;
  double? ipk;
  int? jmlSks;
  int? sksWajib;
  int? sksKonsentrasi;
  int? sksPilihan;

  TranskripModel(
      {this.transkrip,
      this.ipk,
      this.jmlSks,
      this.sksWajib,
      this.sksKonsentrasi,
      this.sksPilihan});

  TranskripModel.fromJson(Map<String, dynamic> json) {
    if (json['Transkrip'] != null) {
      transkrip = <Transkrip>[];
      json['Transkrip'].forEach((v) {
        transkrip!.add(Transkrip.fromJson(v));
      });
    }
    ipk = json['Ipk'];
    jmlSks = json['JmlSks'];
    sksWajib = json['SksWajib'];
    sksKonsentrasi = json['SksKonsentrasi'];
    sksPilihan = json['SksPilihan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (transkrip != null) {
      data['Transkrip'] = transkrip!.map((v) => v.toJson()).toList();
    }
    data['Ipk'] = ipk;
    data['JmlSks'] = jmlSks;
    data['SksWajib'] = sksWajib;
    data['SksKonsentrasi'] = sksKonsentrasi;
    data['SksPilihan'] = sksPilihan;
    return data;
  }
}

class Transkrip {
  String? kode;
  String? namaMk;
  String? namaMkEn;
  String? sifatMk;
  String? namaSifatMk;
  int? jmlSks;
  String? nilai;

  Transkrip(
      {this.kode,
      this.namaMk,
      this.namaMkEn,
      this.sifatMk,
      this.namaSifatMk,
      this.jmlSks,
      this.nilai});

  Transkrip.fromJson(Map<String, dynamic> json) {
    kode = json['Kode'];
    namaMk = json['NamaMk'];
    namaMkEn = json['NamaMkEn'];
    sifatMk = json['SifatMk'];
    namaSifatMk = json['NamaSifatMk'];
    jmlSks = json['JmlSks'];
    nilai = json['Nilai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Kode'] = kode;
    data['NamaMk'] = namaMk;
    data['NamaMkEn'] = namaMkEn;
    data['SifatMk'] = sifatMk;
    data['NamaSifatMk'] = namaSifatMk;
    data['JmlSks'] = jmlSks;
    data['Nilai'] = nilai;
    return data;
  }
}
