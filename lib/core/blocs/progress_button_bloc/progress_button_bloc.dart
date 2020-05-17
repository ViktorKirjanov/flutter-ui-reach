import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'progress_button_event.dart';
part 'progress_button_state.dart';

class ProgressButtonBloc
    extends Bloc<ProgressButtonEvent, ProgressButtonState> {
  final bool initial;

  ProgressButtonBloc([this.initial = true]);

  @override
  ProgressButtonState get initialState =>
      initial ? EnabledProgressButtonState() : DisabledProgressButtonState();

  @override
  Stream<ProgressButtonState> mapEventToState(
    ProgressButtonEvent event,
  ) async* {
    if (event is EnableProgressButtonEvent)
      yield EnabledProgressButtonState();
    else if (event is DisableProgressButtonEvent)
      yield DisabledProgressButtonState();
    else if (event is LoadingProgressButtonEvent)
      yield LoadingProgressButtonState();
  }
}
