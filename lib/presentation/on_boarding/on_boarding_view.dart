import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OnBoardingViewState();
  }
}

class OnBoardingViewState extends State<OnBoardingView> {
  final List<OnBoardingPageModel> _pagesList =
      <OnBoardingPageModel>[
    OnBoardingPageModel(
        title: AppStringsManager.onBoardingTitle1,
        subTitle: AppStringsManager.onBoardingTitle1,
        image: ImageAssets.onBoardingLogo1),
    OnBoardingPageModel(
        title: AppStringsManager.onBoardingTitle2,
        subTitle: AppStringsManager.onBoardingTitle2,
        image: ImageAssets.onBoardingLogo2),
    OnBoardingPageModel(
        title: AppStringsManager.onBoardingTitle3,
        subTitle: AppStringsManager.onBoardingTitle3,
        image: ImageAssets.onBoardingLogo3),
    OnBoardingPageModel(
        title: AppStringsManager.onBoardingTitle4,
        subTitle: AppStringsManager.onBoardingTitle4,
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
        itemCount: _pagesList.length,
          itemBuilder: (context,index)=>OnBoardingPageView(onBoardingPage: _pagesList[index])),
      backgroundColor: ColorsManager.whiteColor,
    );
  }
}
class OnBoardingPageView extends StatelessWidget {
  final OnBoardingPageModel onBoardingPage;
  const OnBoardingPageView({super.key, required this.onBoardingPage});
  @override
  Widget build(BuildContext context) {

   return Column(mainAxisAlignment: MainAxisAlignment.start,
     children: [
       Text(onBoardingPage.title,style:Theme.of(context).textTheme.headline1,),
       Text(onBoardingPage.subTitle,style:Theme.of(context).textTheme.headline2,),
     ],
   );
  }

}
class OnBoardingPageModel{
  final String title;
  final String subTitle;
  final String image;

  OnBoardingPageModel(
      {required this.title, required this.subTitle, required this.image});
}
