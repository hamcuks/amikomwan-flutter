import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'khs_state.dart';

class KhsCubit extends Cubit<KhsState> {
  KhsCubit() : super(KhsInitial());
}
