import 'package:amikom_wan/data/model/profile/profile_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChooseSemesterCubit extends Cubit<int> {
  ChooseSemesterCubit() : super(1);

  void chooseSemester(value) async {
    // open hive box
    var box = await Hive.openBox('app_config');
    ProfileModel data = box.get('profile_data');

    var _semester = value ?? data.periodeAkademik?.semester ?? 1;

    emit(_semester);
  }
}
