class ProfileModel {
  Mhs? mhs;
  PeriodeAkademik? periodeAkademik;

  ProfileModel({this.mhs, this.periodeAkademik});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    mhs = json['Mhs'] != null ? new Mhs.fromJson(json['Mhs']) : null;
    periodeAkademik = json['PeriodeAkademik'] != null
        ? new PeriodeAkademik.fromJson(json['PeriodeAkademik'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mhs != null) {
      data['Mhs'] = this.mhs!.toJson();
    }
    if (this.periodeAkademik != null) {
      data['PeriodeAkademik'] = this.periodeAkademik!.toJson();
    }
    return data;
  }
}

class Mhs {
  String? npm;
  String? nama;
  String? angkatan;
  String? emailAmikom;
  String? passEmail;
  String? prodi;
  int? isBelumLulus;
  int? isAktif;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Npm'] = this.npm;
    data['Nama'] = this.nama;
    data['Angkatan'] = this.angkatan;
    data['EmailAmikom'] = this.emailAmikom;
    data['PassEmail'] = this.passEmail;
    data['Prodi'] = this.prodi;
    data['IsBelumLulus'] = this.isBelumLulus;
    data['IsAktif'] = this.isAktif;
    data['NpmImg'] = this.npmImg;
    return data;
  }
}

class PeriodeAkademik {
  String? tahunAkademik;
  int? semester;

  PeriodeAkademik({this.tahunAkademik, this.semester});

  PeriodeAkademik.fromJson(Map<String, dynamic> json) {
    tahunAkademik = json['TahunAkademik'];
    semester = json['Semester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TahunAkademik'] = this.tahunAkademik;
    data['Semester'] = this.semester;
    return data;
  }
}
