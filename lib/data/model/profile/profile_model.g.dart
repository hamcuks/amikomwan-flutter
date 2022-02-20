// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileModelAdapter extends TypeAdapter<ProfileModel> {
  @override
  final int typeId = 1;

  @override
  ProfileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileModel(
      mhs: fields[0] as Mhs?,
      periodeAkademik: fields[1] as PeriodeAkademik?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.mhs)
      ..writeByte(1)
      ..write(obj.periodeAkademik);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MhsAdapter extends TypeAdapter<Mhs> {
  @override
  final int typeId = 2;

  @override
  Mhs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mhs(
      npm: fields[0] as String?,
      nama: fields[1] as String?,
      angkatan: fields[2] as String?,
      emailAmikom: fields[3] as String?,
      passEmail: fields[4] as String?,
      prodi: fields[5] as String?,
      isBelumLulus: fields[6] as int?,
      isAktif: fields[7] as int?,
      npmImg: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Mhs obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.npm)
      ..writeByte(1)
      ..write(obj.nama)
      ..writeByte(2)
      ..write(obj.angkatan)
      ..writeByte(3)
      ..write(obj.emailAmikom)
      ..writeByte(4)
      ..write(obj.passEmail)
      ..writeByte(5)
      ..write(obj.prodi)
      ..writeByte(6)
      ..write(obj.isBelumLulus)
      ..writeByte(7)
      ..write(obj.isAktif)
      ..writeByte(8)
      ..write(obj.npmImg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MhsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PeriodeAkademikAdapter extends TypeAdapter<PeriodeAkademik> {
  @override
  final int typeId = 3;

  @override
  PeriodeAkademik read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PeriodeAkademik(
      tahunAkademik: fields[0] as String?,
      semester: fields[1] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PeriodeAkademik obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tahunAkademik)
      ..writeByte(1)
      ..write(obj.semester);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeriodeAkademikAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
