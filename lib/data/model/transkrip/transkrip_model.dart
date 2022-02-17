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
        transkrip!.add(new Transkrip.fromJson(v));
      });
    }
    ipk = json['Ipk'];
    jmlSks = json['JmlSks'];
    sksWajib = json['SksWajib'];
    sksKonsentrasi = json['SksKonsentrasi'];
    sksPilihan = json['SksPilihan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transkrip != null) {
      data['Transkrip'] = this.transkrip!.map((v) => v.toJson()).toList();
    }
    data['Ipk'] = this.ipk;
    data['JmlSks'] = this.jmlSks;
    data['SksWajib'] = this.sksWajib;
    data['SksKonsentrasi'] = this.sksKonsentrasi;
    data['SksPilihan'] = this.sksPilihan;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Kode'] = this.kode;
    data['NamaMk'] = this.namaMk;
    data['NamaMkEn'] = this.namaMkEn;
    data['SifatMk'] = this.sifatMk;
    data['NamaSifatMk'] = this.namaSifatMk;
    data['JmlSks'] = this.jmlSks;
    data['Nilai'] = this.nilai;
    return data;
  }
}
