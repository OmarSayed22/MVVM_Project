import 'dart:async';

import 'package:flutter_advanced/domain/use_cases/reset_password_use_case.dart';
import 'package:flutter_advanced/presentation/base/base_view_model.dart';
import 'package:flutter_advanced/presentation/common/state_renderer/state_renderer.dart';

import '../common/freezed_data_class.dart';
import '../common/state_renderer/state_renderer_implementation.dart';

class ForgetPasswordViewModel extends BaseViewModel
    with ForgetPasswordViewModelInputs, ForgetPasswordViewModelOutputs {
  final _emailStreamController = StreamController<String>.broadcast();
  final ResetPasswordUseCase _resetPasswordUseCase;
  var emailObject = EmailObject("");

  ForgetPasswordViewModel(this._resetPasswordUseCase); //inputs
  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  Sink inputEmail() => _emailStreamController.sink;

  @override
  void dispose() {
    _emailStreamController.close();
  }

  @override
  resetPassword() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererTypes.popupLoadingState));
    (await _resetPasswordUseCase
            .execute(ResetPasswordUseCaseInput(emailObject.email)))
        .fold(
            (failure) => inputState.add(ErrorState(
                StateRendererTypes.popupErrorState, failure.message)),
            (supportMessage) => {
                  inputState.add(SuccessState(
                      StateRendererTypes.popupSuccessState,
                      "$supportMessage  ${emailObject.email}"))
                });
  }

  //Outputs
  @override
  Stream<bool?> outputIsEmailValid() =>
      _emailStreamController.stream.map((email) => _isEmailValid(email));

  _isEmailValid(String email) {
    if (email.isNotEmpty) {
      return RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    }
  }

  @override
  setEmail(String email) {
    _emailStreamController.add(email);
    emailObject = emailObject.copyWith(email: email);
  }
}

abstract class ForgetPasswordViewModelInputs {
  resetPassword();

  setEmail(String email);

  Sink inputEmail();
}

abstract class ForgetPasswordViewModelOutputs {
  Stream<bool?> outputIsEmailValid();
}
