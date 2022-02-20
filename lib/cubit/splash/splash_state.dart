part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashSuccess extends SplashState {
  final bool isLoggedIn;
  const SplashSuccess(this.isLoggedIn);

  @override
  List<Object> get props => [isLoggedIn];
}
