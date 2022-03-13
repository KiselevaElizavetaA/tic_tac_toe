part of 'step_bloc.dart';

abstract class StepState extends Equatable {
  const StepState();
}

class StepInitial extends StepState {
  @override
  List<Object> get props => [];
}
