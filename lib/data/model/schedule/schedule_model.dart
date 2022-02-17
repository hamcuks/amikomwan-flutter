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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdHari'] = this.idHari;
    data['IdJam'] = this.idJam;
    data['IdKuliah'] = this.idKuliah;
    data['Keterangan'] = this.keterangan;
    data['Hari'] = this.hari;
    data['Ruang'] = this.ruang;
    data['Waktu'] = this.waktu;
    data['ZoomURL'] = this.zoomURL;
    data['IsZoomURL'] = this.isZoomURL;
    data['Kode'] = this.kode;
    data['MataKuliah'] = this.mataKuliah;
    data['JenisKuliah'] = this.jenisKuliah;
    data['Kelas'] = this.kelas;
    data['Nik'] = this.nik;
    data['NamaDosen'] = this.namaDosen;
    data['EmailDosen'] = this.emailDosen;
    data['Jenjang'] = this.jenjang;
    return data;
  }
}
