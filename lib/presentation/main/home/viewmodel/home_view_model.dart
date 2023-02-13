import 'dart:async';
import 'dart:ffi';

import 'package:flutter_advanced/domain/use_cases/get_home_data_use_case.dart';
import 'package:flutter_advanced/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../domain/models/models.dart';
import '../../../base/base_view_model.dart';
import '../../../common/state_renderer/state_renderer_implementation.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInputs, HomeViewModelOutputs {
  final HomeDataUseCase _homeDataUseCase;

  HomeViewModel(this._homeDataUseCase);

  final StreamController _homeDataStreamController =
      BehaviorSubject<HomeViewObject>();

  @override
  void start() {
    _getHomeData();
  }

  @override
  void dispose() {
    _homeDataStreamController.close();
    super.dispose();
  }

  _getHomeData() async {
    inputState.add(LoadingState(
        stateRendererType: StateRendererTypes.fullScreenLoadingState));
    // ignore: void_checks
    (await _homeDataUseCase.execute(Void)).fold(
        (failure) => {
              // left -> failure

              inputState.add(ErrorState(
                  StateRendererTypes.fullScreenErrorState, failure.message))
            }, (homeObject) {
      // right -> data (success)
      // content
      inputState.add(ContentState());
      inputHomeData.add(HomeViewObject(homeObject.data.stores,
          homeObject.data.services, homeObject.data.banners));
      // navigate to main screen
    });
  }

  @override
  Sink get inputHomeData => _homeDataStreamController.sink;

  @override
  Stream<HomeViewObject> get outputHomeData =>
      _homeDataStreamController.stream.map((event) => event);
}

abstract class HomeViewModelInputs {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutputs {
  Stream<HomeViewObject> get outputHomeData;
}

class HomeViewObject {
  List<Stores> stores;
  List<Services> services;
  List<Banners> banners;

  HomeViewObject(this.stores, this.services, this.banners);
}
