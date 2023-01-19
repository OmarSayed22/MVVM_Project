import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/presentation/on_boarding/viewmodel/on_boarding_view_model.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';
import 'package:flutter_svg/svg.dart';

import '../../../domain/models/models.dart';
import '../../resources/constants.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OnBoardingViewState();
  }
}

class OnBoardingViewState extends State<OnBoardingView> {
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  final PageController _controller = PageController();

  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        stream: _viewModel.outputSliderViewObject,
        builder: (context, snapshot) {
          return _getViewContent(snapshot.data);
        });
  }

  Widget _getViewContent(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: AppSize.size0,
          backgroundColor: ColorsManager.whiteColor,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorsManager.whiteColor,
              statusBarIconBrightness: Brightness.dark),
        ),
        body: PageView.builder(
          physics: const BouncingScrollPhysics(),
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          controller: _controller,
          itemCount: sliderViewObject.noOfSlides,
          itemBuilder: (context, index) => OnBoardingPageView(
              onBoardingPage: sliderViewObject.sliderObjectModel),
        ),
        backgroundColor: ColorsManager.whiteColor,
        bottomSheet: Container(
          height: AppSize.size200,
          color: ColorsManager.whiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginRoute);
                      },
                      child: Text(
                        AppStringsManager.skip,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  )),
              const SizedBox(
                height: AppSize.size20,
              ),
              _getBottomSheetIcons(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetIcons(SliderViewObject sliderViewObject) {
    return Container(
      height: AppSize.size50,
      color: ColorsManager.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildArrow(
            icon: ImageAssets.leftArrow,
            onPressed: () => _controller.animateToPage(
                _viewModel.goToPrevious(),
                duration: Duration(seconds: onBoardingDuration),
                curve: Curves.ease),
          ),
          Row(
            children: _buildCircles(sliderViewObject.currentIndex),
          ),
          _buildArrow(
            icon: ImageAssets.rightArrow,
            onPressed: () => _controller.animateToPage(_viewModel.goToNext(),
                duration: Duration(seconds: onBoardingDuration),
                curve: Curves.ease),
          )
        ],
      ),
    );
  }

  Widget _buildArrow(
      {required String icon, required void Function() onPressed}) {
    return IconButton(
      iconSize: AppSize.size40,
      onPressed: onPressed,
      icon: SvgPicture.asset(icon),
    );
  }

  List<Widget> _buildCircles(int currentIndex) {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: SvgPicture.asset(
          i == currentIndex
              ? ImageAssets.hollowCircle
              : ImageAssets.solidCircle,
          height: AppSize.size10,
          width: AppSize.size10,
        ),
      ));
    }
    return list;
  }
}

class OnBoardingPageView extends StatelessWidget {
  final SliderObjectModel onBoardingPage;

  const OnBoardingPageView({super.key, required this.onBoardingPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            onBoardingPage.title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            onBoardingPage.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        const SizedBox(
          height: AppSize.size80,
        ),
        SvgPicture.asset(onBoardingPage.image),
      ],
    );
  }
}
