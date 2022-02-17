part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  ProfileModel data;

  ProfileSuccess(this.data);

  @override
  // TODO: implement props
  List<Object> get props => [data];
}

class ProfileError extends ProfileState {
  String message;

  ProfileError(this.message);

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
