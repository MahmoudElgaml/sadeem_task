// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginResponseEntityAdapter extends TypeAdapter<LoginResponseEntity> {
  @override
  final int typeId = 2;

  @override
  LoginResponseEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoginResponseEntity(
      name: fields[1] as String?,
      email: fields[2] as String?,
      image: fields[3] as String?,
      id: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, LoginResponseEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
