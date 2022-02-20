// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduleModelAdapter extends TypeAdapter<ScheduleModel> {
  @override
  final int typeId = 0;

  @override
  ScheduleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ScheduleModel(
      idHari: fields[0] as int?,
      idJam: fields[1] as int?,
      idKuliah: fields[2] as int?,
      keterangan: fields[3] as String?,
      hari: fields[4] as String?,
      ruang: fields[5] as String?,
      waktu: fields[6] as String?,
      zoomURL: fields[7] as String?,
      isZoomURL: fields[8] as int?,
      kode: fields[9] as String?,
      mataKuliah: fields[10] as String?,
      jenisKuliah: fields[11] as String?,
      kelas: fields[12] as String?,
      nik: fields[13] as String?,
      namaDosen: fields[14] as String?,
      emailDosen: fields[15] as String?,
      jenjang: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ScheduleModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.idHari)
      ..writeByte(1)
      ..write(obj.idJam)
      ..writeByte(2)
      ..write(obj.idKuliah)
      ..writeByte(3)
      ..write(obj.keterangan)
      ..writeByte(4)
      ..write(obj.hari)
      ..writeByte(5)
      ..write(obj.ruang)
      ..writeByte(6)
      ..write(obj.waktu)
      ..writeByte(7)
      ..write(obj.zoomURL)
      ..writeByte(8)
      ..write(obj.isZoomURL)
      ..writeByte(9)
      ..write(obj.kode)
      ..writeByte(10)
      ..write(obj.mataKuliah)
      ..writeByte(11)
      ..write(obj.jenisKuliah)
      ..writeByte(12)
      ..write(obj.kelas)
      ..writeByte(13)
      ..write(obj.nik)
      ..writeByte(14)
      ..write(obj.namaDosen)
      ..writeByte(15)
      ..write(obj.emailDosen)
      ..writeByte(16)
      ..write(obj.jenjang);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScheduleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
