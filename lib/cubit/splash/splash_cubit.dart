import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  void getCredential() async {
    var box = await Hive.openBox('credentials');
    var isLoggedIn = await box.get('isLoggedIn') ?? false;

    emit(SplashSuccess(isLoggedIn));
  }
}
