import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'khs_akadmik_info_state.dart';

class KhsAkadmikInfoCubit extends Cubit<KhsAkadmikInfoState> {
  KhsAkadmikInfoCubit() : super(KhsAkadmikInfoInitial());
}
