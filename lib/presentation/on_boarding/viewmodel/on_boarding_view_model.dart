import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_advanced/presentation/base/base_view_model.dart';

import '../../../domain/models/models.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late List<SliderObjectModel> _pagesList;
  int _currentIndex = 0;

  // OnBoardingViewModel Inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _pagesList = _getSliderData();
    _postDataToView();
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  int goToPrevious() =>
      _currentIndex == 0 ? _pagesList.length - 1 : _currentIndex - 1;

  @override
  int goToNext() =>
      _currentIndex == _pagesList.length - 1 ? 0 : _currentIndex + 1;

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  // OnBoardingViewModel Outputs
  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  List<SliderObjectModel> _getSliderData() => <SliderObjectModel>[
        SliderObjectModel(
            title: AppStringsManager.onBoardingTitle1.tr(),
            subTitle: AppStringsManager.onBoardingSubTitle1.tr(),
            image: ImageAssets.onBoardingLogo1),
        SliderObjectModel(
            title: AppStringsManager.onBoardingTitle2.tr(),
            subTitle: AppStringsManager.onBoardingSubTitle2.tr(),
            image: ImageAssets.onBoardingLogo2),
        SliderObjectModel(
            title: AppStringsManager.onBoardingTitle3.tr(),
            subTitle: AppStringsManager.onBoardingSubTitle3.tr(),
            image: ImageAssets.onBoardingLogo3),
        SliderObjectModel(
            title: AppStringsManager.onBoardingTitle4.tr(),
            subTitle: AppStringsManager.onBoardingSubTitle4.tr(),
            image: ImageAssets.onBoardingLogo4),
      ];

  void _postDataToView() => inputSliderViewObject.add(SliderViewObject(
      sliderObjectModel: _pagesList[_currentIndex],
      noOfSlides: _pagesList.length,
      currentIndex: _currentIndex));
}

abstract class OnBoardingViewModelInputs {
  void onPageChanged(int index);

  int goToPrevious();

  int goToNext();

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
