part of 'selected_chart_bar_bloc.dart';

abstract class SelectedChartBarEvent extends Equatable {
  const SelectedChartBarEvent();

  @override
  List<Object> get props => null;
}

class SelectChartBarEvent extends SelectedChartBarEvent {
  final index;

  SelectChartBarEvent(this.index);

  @override
  List<Object> get props => [index];
}

class ResetChartBarEvent extends SelectedChartBarEvent {}
