import 'package:hive/hive.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 1)
class ProfileModel {
  @HiveField(0)
  Mhs? mhs;

  @HiveField(1)
  PeriodeAkademik? periodeAkademik;

  ProfileModel({this.mhs, this.periodeAkademik});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    mhs = json['Mhs'] != null ? Mhs.fromJson(json['Mhs']) : null;
    periodeAkademik = json['PeriodeAkademik'] != null
        ? PeriodeAkademik.fromJson(json['PeriodeAkademik'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mhs != null) {
      data['Mhs'] = mhs!.toJson();
    }
    if (periodeAkademik != null) {
      data['PeriodeAkademik'] = periodeAkademik!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 2)
class Mhs {
  @HiveField(0)
  String? npm;

  @HiveField(1)
  String? nama;

  @HiveField(2)
  String? angkatan;

  @HiveField(3)
  String? emailAmikom;

  @HiveField(4)
  String? passEmail;

  @HiveField(5)
  String? prodi;

  @HiveField(6)
  int? isBelumLulus;

  @HiveField(7)
  int? isAktif;

  @HiveField(8)
  String? npmImg;

  Mhs(
      {this.npm,
      this.nama,
      this.angkatan,
      this.emailAmikom,
      this.passEmail,
      this.prodi,
      this.isBelumLulus,
      this.isAktif,
      this.npmImg});

  Mhs.fromJson(Map<String, dynamic> json) {
    npm = json['Npm'];
    nama = json['Nama'];
    angkatan = json['Angkatan'];
    emailAmikom = json['EmailAmikom'];
    passEmail = json['PassEmail'];
    prodi = json['Prodi'];
    isBelumLulus = json['IsBelumLulus'];
    isAktif = json['IsAktif'];
    npmImg = json['NpmImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Npm'] = npm;
    data['Nama'] = nama;
    data['Angkatan'] = angkatan;
    data['EmailAmikom'] = emailAmikom;
    data['PassEmail'] = passEmail;
    data['Prodi'] = prodi;
    data['IsBelumLulus'] = isBelumLulus;
    data['IsAktif'] = isAktif;
    data['NpmImg'] = npmImg;
    return data;
  }
}

@HiveType(typeId: 3)
class PeriodeAkademik {
  @HiveField(0)
  String? tahunAkademik;

  @HiveField(1)
  int? semester;

  PeriodeAkademik({this.tahunAkademik, this.semester});

  PeriodeAkademik.fromJson(Map<String, dynamic> json) {
    tahunAkademik = json['TahunAkademik'];
    semester = json['Semester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TahunAkademik'] = tahunAkademik;
    data['Semester'] = semester;
    return data;
  }
}
