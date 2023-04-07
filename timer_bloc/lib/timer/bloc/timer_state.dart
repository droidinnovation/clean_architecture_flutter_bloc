part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState(this.duration);
  final int duration;

  @override
  List<Object> get props => [duration];
}

//the user will be able to start the timer.
class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial {duration : $duration }';
}

//the user will be able to pause and reset the timer as well as see the remaining duration.
class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

//the user will be able to resume the timer and reset the timer.
class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

//the user will be able to reset the timer.
class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
