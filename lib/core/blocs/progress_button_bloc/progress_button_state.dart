part of 'progress_button_bloc.dart';

abstract class ProgressButtonState extends Equatable {
  const ProgressButtonState();

  @override
  List<Object> get props => [];
}

class EnabledProgressButtonState extends ProgressButtonState {}

class DisabledProgressButtonState extends ProgressButtonState {}

class LoadingProgressButtonState extends ProgressButtonState {}
