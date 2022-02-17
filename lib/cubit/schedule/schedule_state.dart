part of 'schedule_cubit.dart';

abstract class ScheduleState extends Equatable {
  const ScheduleState();

  @override
  List<Object> get props => [];
}

class ScheduleInitial extends ScheduleState {}

class ScheduleLoading extends ScheduleState {}

class ScheduleSuccess extends ScheduleState {
  List<ScheduleModel> data;

  ScheduleSuccess(this.data);

  @override
  List<Object> get props => [data];
}

class ScheduleError extends ScheduleState {
  String message;

  ScheduleError(this.message);

  @override
  List<Object> get props => [message];
}
