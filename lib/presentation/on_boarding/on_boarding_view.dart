import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/constants.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OnBoardingViewState();
  }
}

class OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController();

  int _currentIndex = 0;

  final List<OnBoardingPageModel> _pagesList = <OnBoardingPageModel>[
    OnBoardingPageModel(
        title: AppStringsManager.onBoardingTitle1,
        subTitle: AppStringsManager.onBoardingSubTitle1,
        image: ImageAssets.onBoardingLogo1),
    OnBoardingPageModel(
        title: AppStringsManager.onBoardingTitle2,
        subTitle: AppStringsManager.onBoardingSubTitle2,
        image: ImageAssets.onBoardingLogo2),
    OnBoardingPageModel(
        title: AppStringsManager.onBoardingTitle3,
        subTitle: AppStringsManager.onBoardingSubTitle3,
        image: ImageAssets.onBoardingLogo3),
    OnBoardingPageModel(
        title: AppStringsManager.onBoardingTitle4,
        subTitle: AppStringsManager.onBoardingSubTitle4,
        image: ImageAssets.onBoardingLogo4),
  ];

  @override
  Widget build(BuildContext context) {
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
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _controller,
        itemCount: _pagesList.length,
        itemBuilder: (context, index) =>
            OnBoardingPageView(onBoardingPage: _pagesList[index]),
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
            _getBottomSheetIcons(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetIcons() {
    return Container(
      height: AppSize.size50,
      color: ColorsManager.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildArrow(
            icon: ImageAssets.leftArrow,
            onPressed: () => _controller.animateToPage(
                _currentIndex == 0 ? _pagesList.length - 1 : _currentIndex - 1,
                duration: Duration(seconds: onBoardingDuration),
                curve: Curves.ease),
          ),
          Row(
            children: _buildCircles(),
          ),
          _buildArrow(
            icon: ImageAssets.rightArrow,
            onPressed: () => _controller.animateToPage(
                _currentIndex == _pagesList.length - 1 ? 0 : _currentIndex + 1,
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

  List<Widget> _buildCircles() {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: SvgPicture.asset(
          i == _currentIndex
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
  final OnBoardingPageModel onBoardingPage;

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

class OnBoardingPageModel {
  final String title;
  final String subTitle;
  final String image;

  OnBoardingPageModel(
      {required this.title, required this.subTitle, required this.image});
}
