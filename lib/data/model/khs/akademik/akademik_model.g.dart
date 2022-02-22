// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'akademik_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AkademikModelAdapter extends TypeAdapter<AkademikModel> {
  @override
  final int typeId = 4;

  @override
  AkademikModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AkademikModel(
      tahun: (fields[0] as List?)?.cast<Tahun>(),
      semester: (fields[1] as List?)?.cast<Semester>(),
    );
  }

  @override
  void write(BinaryWriter writer, AkademikModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tahun)
      ..writeByte(1)
      ..write(obj.semester);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AkademikModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TahunAdapter extends TypeAdapter<Tahun> {
  @override
  final int typeId = 5;

  @override
  Tahun read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tahun(
      thnAjaran: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Tahun obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.thnAjaran);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TahunAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SemesterAdapter extends TypeAdapter<Semester> {
  @override
  final int typeId = 6;

  @override
  Semester read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Semester(
      kode: fields[0] as int?,
      nama: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Semester obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.kode)
      ..writeByte(1)
      ..write(obj.nama);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SemesterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
