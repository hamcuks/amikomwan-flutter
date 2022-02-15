import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'krs_state.dart';

class KrsCubit extends Cubit<KrsState> {
  KrsCubit() : super(KrsInitial());
}
