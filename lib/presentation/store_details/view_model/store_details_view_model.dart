import 'dart:async';
import 'dart:ffi';

import 'package:flutter_advanced/domain/use_cases/store_details_use_case.dart';
import 'package:flutter_advanced/presentation/base/base_view_model.dart';
import 'package:flutter_advanced/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter_advanced/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:rxdart/rxdart.dart';

class StoreDetailsViewModel extends BaseViewModel
    with StoreDetailsViewModelInputs, StoreDetailsViewModelOutputs {
  final StoreDetailsUseCase _storeDetailsUseCase;

  final _streamController = BehaviorSubject<StoreDetailsViewObject>();

  StoreDetailsViewModel(this._storeDetailsUseCase);

  @override
  void start() {
    _getStoreDetailsData();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Sink get inputStoreDetails => _streamController.sink;

  @override
  Stream<StoreDetailsViewObject> get outputStoreDetails =>
      _streamController.stream.map((event) => event);

  _getStoreDetailsData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererTypes.fullScreenLoadingState));
    (await _storeDetailsUseCase.execute(Void)).fold(
        (failure) => inputState.add(ErrorState(
            StateRendererTypes.fullScreenErrorState, failure.message)), (data) {
      inputState.add(ContentState());
      inputStoreDetails.add(StoreDetailsViewObject(data.image, data.id,
          data.title, data.details, data.services, data.about));
    });
  }
}

abstract class StoreDetailsViewModelOutputs {
  Stream<StoreDetailsViewObject> get outputStoreDetails;
}

abstract class StoreDetailsViewModelInputs {
  Sink get inputStoreDetails;
}

class StoreDetailsViewObject {
  String image;
  int id;
  String title;
  String details;
  String services;
  String about;

  StoreDetailsViewObject(
      this.image, this.id, this.title, this.details, this.services, this.about);
}
