import 'package:hive/hive.dart';

part 'akademik_model.g.dart';

@HiveType(typeId: 4)
class AkademikModel {
  @HiveField(0)
  List<Tahun>? tahun;

  @HiveField(1)
  List<Semester>? semester;

  AkademikModel({this.tahun, this.semester});

  AkademikModel.fromJson(Map<String, dynamic> json) {
    if (json['Tahun'] != null) {
      tahun = <Tahun>[];
      json['Tahun'].forEach((v) {
        tahun!.add(new Tahun.fromJson(v));
      });
    }
    if (json['Semester'] != null) {
      semester = <Semester>[];
      json['Semester'].forEach((v) {
        semester!.add(new Semester.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tahun != null) {
      data['Tahun'] = this.tahun!.map((v) => v.toJson()).toList();
    }
    if (this.semester != null) {
      data['Semester'] = this.semester!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@HiveType(typeId: 5)
class Tahun {
  @HiveField(0)
  String? thnAjaran;

  Tahun({this.thnAjaran});

  Tahun.fromJson(Map<String, dynamic> json) {
    thnAjaran = json['thn_ajaran'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thn_ajaran'] = this.thnAjaran;
    return data;
  }
}

@HiveType(typeId: 6)
class Semester {
  @HiveField(0)
  int? kode;

  @HiveField(1)
  String? nama;

  Semester({this.kode, this.nama});

  Semester.fromJson(Map<String, dynamic> json) {
    kode = json['Kode'];
    nama = json['Nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Kode'] = this.kode;
    data['Nama'] = this.nama;
    return data;
  }
}
