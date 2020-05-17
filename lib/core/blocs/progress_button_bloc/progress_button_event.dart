part of 'progress_button_bloc.dart';

abstract class ProgressButtonEvent extends Equatable {
  const ProgressButtonEvent();

  @override
  List<Object> get props => null;
}

class EnableProgressButtonEvent extends ProgressButtonEvent {}

class DisableProgressButtonEvent extends ProgressButtonEvent {}

class LoadingProgressButtonEvent extends ProgressButtonEvent {}
