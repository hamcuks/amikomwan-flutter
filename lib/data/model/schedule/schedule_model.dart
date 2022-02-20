class ScheduleModel {
  int? idHari;
  int? idJam;
  int? idKuliah;
  String? keterangan;
  String? hari;
  String? ruang;
  String? waktu;
  String? zoomURL;
  int? isZoomURL;
  String? kode;
  String? mataKuliah;
  String? jenisKuliah;
  String? kelas;
  String? nik;
  String? namaDosen;
  String? emailDosen;
  String? jenjang;

  ScheduleModel(
      {this.idHari,
      this.idJam,
      this.idKuliah,
      this.keterangan,
      this.hari,
      this.ruang,
      this.waktu,
      this.zoomURL,
      this.isZoomURL,
      this.kode,
      this.mataKuliah,
      this.jenisKuliah,
      this.kelas,
      this.nik,
      this.namaDosen,
      this.emailDosen,
      this.jenjang});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    idHari = json['IdHari'];
    idJam = json['IdJam'];
    idKuliah = json['IdKuliah'];
    keterangan = json['Keterangan'];
    hari = json['Hari'];
    ruang = json['Ruang'];
    waktu = json['Waktu'];
    zoomURL = json['ZoomURL'];
    isZoomURL = json['IsZoomURL'];
    kode = json['Kode'];
    mataKuliah = json['MataKuliah'];
    jenisKuliah = json['JenisKuliah'];
    kelas = json['Kelas'];
    nik = json['Nik'];
    namaDosen = json['NamaDosen'];
    emailDosen = json['EmailDosen'];
    jenjang = json['Jenjang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IdHari'] = idHari;
    data['IdJam'] = idJam;
    data['IdKuliah'] = idKuliah;
    data['Keterangan'] = keterangan;
    data['Hari'] = hari;
    data['Ruang'] = ruang;
    data['Waktu'] = waktu;
    data['ZoomURL'] = zoomURL;
    data['IsZoomURL'] = isZoomURL;
    data['Kode'] = kode;
    data['MataKuliah'] = mataKuliah;
    data['JenisKuliah'] = jenisKuliah;
    data['Kelas'] = kelas;
    data['Nik'] = nik;
    data['NamaDosen'] = namaDosen;
    data['EmailDosen'] = emailDosen;
    data['Jenjang'] = jenjang;
    return data;
  }
}
