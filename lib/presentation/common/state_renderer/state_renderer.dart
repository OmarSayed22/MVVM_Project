import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';
import 'package:lottie/lottie.dart';

enum StateRendererTypes {
  //Popup States (Dialog)
  popupLoadingState,
  popupErrorState,
  popupSuccessState,
// Full Screen States
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,
  fullScreenSuccessState,
  contentState,
}

class StateRenderer extends StatelessWidget {
  final StateRendererTypes stateRendererTypes;
  final String title;
  final String message;
  final Function retryActionFunction;

  const StateRenderer(
      {required this.stateRendererTypes,
      this.title = "",
      required this.message,
      required this.retryActionFunction,
      super.key});

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererTypes) {
      case StateRendererTypes.popupLoadingState:
        return _buildPopupDialog(context, [
          _buildAnimatedImage(JsonAssets.loading),
          _buildMessage(message),
        ]);
      case StateRendererTypes.popupErrorState:
        return _buildPopupDialog(context, [
          _buildAnimatedImage(JsonAssets.error),
          _buildMessage(message),
          _buildRetryButton(AppStringsManager.ok.tr(), context)
        ]);
      case StateRendererTypes.popupSuccessState:
        return _buildPopupDialog(context, [
          _buildAnimatedImage(JsonAssets.success),
          _buildTitle(title),
          _buildMessage(message),
          _buildRetryButton(AppStringsManager.ok.tr(), context)
        ]);
      case StateRendererTypes.fullScreenLoadingState:
        return Center(
          child: _buildItemsColumn([
            _buildAnimatedImage(JsonAssets.loading),
            _buildMessage(message),
          ]),
        );
      case StateRendererTypes.fullScreenErrorState:
        return _buildItemsColumn([
          _buildAnimatedImage(JsonAssets.error),
          _buildMessage(message),
          _buildRetryButton(AppStringsManager.retryAgain.tr(), context),
        ]);
      case StateRendererTypes.fullScreenEmptyState:
        return _buildItemsColumn([
          _buildAnimatedImage(JsonAssets.empty),
          _buildMessage(message),
        ]);
      case StateRendererTypes.contentState:
        return Container();
      default:
        return Container();
    }
  }

  Widget _buildItemsColumn(
    List<Widget> children,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildAnimatedImage(String imagePath) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      height: AppSize.size100,
      width: AppSize.size100,
      child: Lottie.asset(imagePath),
    );
  }

  Widget _buildMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: getRegularStyle(
              color: ColorsManager.blackColor, fontSize: FontSize.s16),
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Center(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: getRegularStyle(
            color: ColorsManager.blackColor, fontSize: FontSize.s16),
      ),
    );
  }

  Widget _buildRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.all(AppPadding.p16),
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                if (stateRendererTypes ==
                    StateRendererTypes.fullScreenErrorState) {
                  retryActionFunction.call();
                } else {
                  // stateRendererTypes==StateRendererTypes.popupErrorState
                  Navigator.of(context).pop();
                }
              },
              child: Text(buttonTitle))),
    );
  }

  Widget _buildPopupDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.size14)),
      elevation: AppSize.size1_5,
      child: Container(
        decoration: BoxDecoration(
            color: ColorsManager.whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.size14),
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: _buildDialogContent(children),
      ),
    );
  }

  Column _buildDialogContent(List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
