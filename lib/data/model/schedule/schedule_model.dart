import 'package:hive/hive.dart';

part 'schedule_model.g.dart';

@HiveType(typeId: 0)
class ScheduleModel {
  @HiveField(0)
  int? idHari;

  @HiveField(1)
  int? idJam;

  @HiveField(2)
  int? idKuliah;

  @HiveField(3)
  String? keterangan;

  @HiveField(4)
  String? hari;

  @HiveField(5)
  String? ruang;

  @HiveField(6)
  String? waktu;

  @HiveField(7)
  String? zoomURL;

  @HiveField(8)
  int? isZoomURL;

  @HiveField(9)
  String? kode;

  @HiveField(10)
  String? mataKuliah;

  @HiveField(11)
  String? jenisKuliah;

  @HiveField(12)
  String? kelas;

  @HiveField(13)
  String? nik;

  @HiveField(14)
  String? namaDosen;

  @HiveField(15)
  String? emailDosen;

  @HiveField(16)
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
