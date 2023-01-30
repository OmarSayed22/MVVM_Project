import 'package:flutter/material.dart';
import 'package:flutter_advanced/application/constants.dart';
import 'package:flutter_advanced/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';

abstract class FlowState {
  StateRendererTypes getStateRendererType();

  String getMessage();

  String? getTitle();
}

// Loading State (full Screen or popup)
class LoadingState extends FlowState {
  StateRendererTypes stateRendererType;
  String? message;

  LoadingState(
      {required this.stateRendererType,
      this.message = AppStringsManager.loading});

  @override
  String getMessage() => message ?? AppStringsManager.loading;

  @override
  StateRendererTypes getStateRendererType() => stateRendererType;

  @override
  String? getTitle() => null;
}

// error State (full Screen or popup)
class ErrorState extends FlowState {
  StateRendererTypes stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererTypes getStateRendererType() => stateRendererType;

  @override
  String? getTitle() => AppStringsManager.error;
}

//Success State (full Screen or popup)
class SuccessState extends FlowState {
  StateRendererTypes stateRendererType;
  String message;

  SuccessState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererTypes getStateRendererType() => stateRendererType;

  @override
  String? getTitle() => AppStringsManager.success;
}

// content State (full Screen or popup)
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererTypes getStateRendererType() => StateRendererTypes.contentState;

  @override
  String? getTitle() {
    return null;
  }
}

// Empty State (full Screen )
class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererTypes getStateRendererType() =>
      StateRendererTypes.fullScreenEmptyState;

  @override
  String? getTitle() {
    return null;
  }
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        if (getStateRendererType() == StateRendererTypes.popupLoadingState) {
          //show popup loading state
          showPopup(context, getStateRendererType(), getTitle(), getMessage());
          return contentScreenWidget;
        } else {
          //show full screen loading state
          return StateRenderer(
              stateRendererTypes: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction);
        }
      case ErrorState:
        dismissDialog(context);
        if (getStateRendererType() == StateRendererTypes.popupErrorState) {
          //show popup Error state
          showPopup(context, getStateRendererType(), getTitle(), getMessage());
          return contentScreenWidget;
        } else {
          //show full screen Error state
          return StateRenderer(
              stateRendererTypes: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction);
        }
      case SuccessState:
        dismissDialog(context);
        if (getStateRendererType() == StateRendererTypes.popupSuccessState) {
          showPopup(context, getStateRendererType(), getTitle(), getMessage());
          return contentScreenWidget;
        } else {
          return StateRenderer(
              stateRendererTypes: getStateRendererType(),
              message: getMessage(),
              retryActionFunction: retryActionFunction);
        }

      case ContentState:
        dismissDialog(context);
        return contentScreenWidget;
      case EmptyState:
        return StateRenderer(
            stateRendererTypes: getStateRendererType(),
            message: getMessage(),
            retryActionFunction: () {});
      default:
        dismissDialog(context);
        return contentScreenWidget;
    }
  }

// check if any dialog is  opened;
  bool _isCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  showPopup(BuildContext context, StateRendererTypes stateRendererType,
      String? title, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (BuildContext context) => StateRenderer(
                stateRendererTypes: stateRendererType,
                title: title ?? "",
                retryActionFunction: () {},
                message: message,
              ));
    });
  }
}
