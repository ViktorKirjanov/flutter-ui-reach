import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'selected_chart_bar_event.dart';
part 'selected_chart_bar_state.dart';

class SelectedChartBarBloc
    extends Bloc<SelectedChartBarEvent, SelectedChartBarState> {
  @override
  SelectedChartBarState get initialState => SelectedChartBarInitial();

  @override
  Stream<SelectedChartBarState> mapEventToState(
    SelectedChartBarEvent event,
  ) async* {
    if (event is SelectChartBarEvent) {
      yield SelectedState(event.index);
    } else if (event is ResetChartBarEvent) {
      yield SelectedChartBarInitial();
    }
  }
}
