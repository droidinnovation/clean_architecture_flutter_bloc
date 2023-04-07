part of 'timer_bloc.dart';

//Our TimerBloc will need to know how to process the following events:
abstract class TimerEvent extends Equatable {
  const TimerEvent();

  @override
  List<Object> get props => [];
}

//— informs the TimerBloc that the timer should be started.
class TimerStarted extends TimerEvent {
  final int duration;

  const TimerStarted({required this.duration});
}

//— informs the TimerBloc that the timer should be paused.
class TimerPaused extends TimerEvent {
  const TimerPaused();
}

//— informs the TimerBloc that the timer should be resumed.
class TimerResumed extends TimerEvent {
  const TimerResumed();
}

//TimerReset — informs the TimerBloc that the timer should be reset to the original state.
class TimerReset extends TimerEvent {
  const TimerReset();
}

// — informs the TimerBloc that a tick has occurred and that it needs to update its state accordingly.
class _TimerTicked extends TimerEvent {
  const _TimerTicked({required this.duration});
  final int duration;
}
