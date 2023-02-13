import 'dart:async';

import 'package:flutter_advanced/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  final _stateStreamController = BehaviorSubject<FlowState>();

  @override
  Sink get inputState => _stateStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _stateStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _stateStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start();

  void dispose();

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
