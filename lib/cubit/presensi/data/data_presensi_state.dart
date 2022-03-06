part of 'data_presensi_cubit.dart';

abstract class DataPresensiState extends Equatable {
  const DataPresensiState();

  @override
  List<Object> get props => [];
}

class DataPresensiInitial extends DataPresensiState {}

class DataPresensiLoading extends DataPresensiState {}

class DataPresensiSuccess extends DataPresensiState {
  final List<DataPresensiModel> data;

  const DataPresensiSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class DataPresensiError extends DataPresensiState {
  final String message;

  const DataPresensiError(this.message);

  @override
  List<Object> get props => [message];
}
