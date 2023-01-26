import 'package:flutter/material.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';
import 'package:lottie/lottie.dart';

enum StateRendererTypes {
  //Popup States (Dialog)
  popupLoadingState,
  popupErrorState,

// Full Screen States
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,
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
      this.message = AppStringsManager.loading,
      required this.retryActionFunction,
      super.key});

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererTypes) {
      case StateRendererTypes.popupLoadingState:
        return _buildPopupDialog(
            context, [_buildAnimatedImage(JsonAssets.loading)]);
      case StateRendererTypes.popupErrorState:
        return _buildPopupDialog(context, [
          _buildAnimatedImage(JsonAssets.error),
          _buildMessage(message),
          _buildRetryButton(AppStringsManager.ok, context)
        ]);
      case StateRendererTypes.fullScreenLoadingState:
        return _buildItemsColumn([
          _buildAnimatedImage(JsonAssets.loading),
          _buildMessage(message),
        ]);
      case StateRendererTypes.fullScreenErrorState:
        return _buildItemsColumn([
          _buildAnimatedImage(JsonAssets.error),
          _buildMessage(message),
          _buildRetryButton(AppStringsManager.retryAgain, context),
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

  Widget _buildItemsColumn(List<Widget> children,
      {MainAxisSize mainAxisSize = MainAxisSize.max}) {
    return Column(
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _buildAnimatedImage(String imagePath) {
    return SizedBox(
      height: AppSize.size100,
      width: AppSize.size100,
      child: Lottie.asset(imagePath),
    );
  }

  Widget _buildMessage(String message) {
    return Text(
      message,
      style: getRegularStyle(
          color: ColorsManager.blackColor, fontSize: FontSize.s18),
    );
  }

  Widget _buildRetryButton(String buttonTitle, BuildContext context) {
    return SizedBox(
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
            child: Text(buttonTitle)));
  }

  Widget _buildPopupDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.size14)),
      elevation: AppSize.size1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorsManager.whiteColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.size14),
            boxShadow: const [BoxShadow(color: Colors.black26)]),
        child: _buildItemsColumn(children, mainAxisSize: MainAxisSize.min),
      ),
    );
  }
}
