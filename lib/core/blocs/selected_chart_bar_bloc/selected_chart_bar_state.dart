part of 'selected_chart_bar_bloc.dart';

abstract class SelectedChartBarState extends Equatable {
  const SelectedChartBarState();
}

class SelectedChartBarInitial extends SelectedChartBarState {
  @override
  List<Object> get props => [];
}

class SelectedState extends SelectedChartBarState {
  final int index;

  SelectedState(this.index);

  @override
  List<Object> get props => [index];
}
