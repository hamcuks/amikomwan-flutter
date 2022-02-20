part of 'khs_akadmik_info_cubit.dart';

abstract class KhsAkadmikInfoState extends Equatable {
  const KhsAkadmikInfoState();

  @override
  List<Object> get props => [];
}

class KhsAkadmikInfoInitial extends KhsAkadmikInfoState {}

class KhsAkadmikInfoLoading extends KhsAkadmikInfoState {}

class KhsAkadmikInfoSuccess extends KhsAkadmikInfoState {}

class KhsAkadmikInfoError extends KhsAkadmikInfoState {}
