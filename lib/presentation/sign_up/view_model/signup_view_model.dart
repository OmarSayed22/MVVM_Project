import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_advanced/domain/use_cases/signup_use_case.dart';
import 'package:flutter_advanced/presentation/common/state_renderer/state_renderer_implementation.dart';
import 'package:flutter_advanced/presentation/resources/resources.dart';
import 'package:flutter_advanced/presentation/sign_up/view_model/signup_view_model_inputs.dart';
import 'package:flutter_advanced/presentation/sign_up/view_model/signup_view_model_outputs.dart';

import '../../base/base_view_model.dart';
import '../../common/freezed_data_class.dart';
import '../../common/functions.dart';
import '../../common/state_renderer/state_renderer.dart';

class SignupViewModel extends BaseViewModel
    with SignupViewModelInputs, SignupViewModelOutputs {
  final _firstNameStreamController = StreamController<String>.broadcast();
  final _lastNameStreamController = StreamController<String>.broadcast();
  final _flagStreamCodeController = StreamController<String>.broadcast();
  final _mobileNumberStreamController = StreamController<String>.broadcast();
  final _emailStreamController = StreamController<String>.broadcast();
  final _passwordStreamController = StreamController<String>.broadcast();
  final _confirmPasswordStreamController = StreamController<String>.broadcast();
  final _profilePictureStreamController = StreamController<File>.broadcast();
  final isUserRegisteredSuccessfully = StreamController<bool>.broadcast();
  final areAllInputsValidStreamController = StreamController<void>.broadcast();

  final SignupUseCase _useCase;

  SignupViewModel(this._useCase);

  SignupObject signupObject = SignupObject(
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  );

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _firstNameStreamController.close();
    _lastNameStreamController.close();
    _flagStreamCodeController.close();
    _mobileNumberStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _confirmPasswordStreamController.close();
    _profilePictureStreamController.close();
    isUserRegisteredSuccessfully.close();
    super.dispose();
  }

// Inputs
  @override
  Sink get inputConfirmPassword => _confirmPasswordStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputFirstName => _firstNameStreamController.sink;

  @override
  Sink get inputLastName => _lastNameStreamController.sink;

  @override
  Sink get inputMobileNumber => _mobileNumberStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputProfilePicture => _profilePictureStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => areAllInputsValidStreamController.sink;

  @override
  setFirstName(String firstName) {
    if (firstName.isNotEmpty) {
      signupObject = signupObject.copyWith(firstName: firstName);
    } else {
      signupObject = signupObject.copyWith(firstName: "");
    }
    inputFirstName.add(firstName);
    _validator();
  }

  @override
  setLastName(String lastName) {
    if (lastName.isNotEmpty) {
      signupObject = signupObject.copyWith(lastName: lastName);
    } else {
      signupObject = signupObject = signupObject.copyWith(lastName: "");
    }
    inputLastName.add(lastName);
    _validator();
  }

  @override
  Sink get inputFlag => _flagStreamCodeController.sink;

  @override
  setFlag(String flag) {
    inputFlag.add(flag);
  }

  @override
  setCountryMobileCode(String countryMobileCode) {
    if (countryMobileCode.isNotEmpty) {
      signupObject =
          signupObject.copyWith(countryMobileCode: countryMobileCode);
    } else {
      signupObject = signupObject.copyWith(countryMobileCode: " ");
    }
    _validator();
  }

  @override
  setMobileNumber(String mobileNumber) {
    if (mobileNumber.isNotEmpty &&
        isValid(
            input: mobileNumber, pattern: AppStringsManager.mobilePattern)) {
      signupObject = signupObject.copyWith(mobileNumber: mobileNumber);
    } else {
      signupObject = signupObject.copyWith(mobileNumber: " ");
    }
    inputMobileNumber.add(mobileNumber);
    _validator();
  }

  @override
  setEmail(String email) {
    if (email.isNotEmpty &&
        isValid(
            input: email,
            pattern:
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")) {
      signupObject = signupObject.copyWith(email: email);
    } else {
      signupObject = signupObject.copyWith(email: "");
    }
    inputEmail.add(email);
    _validator();
  }

  @override
  setPassword(String password) {
    if (password.isNotEmpty &&
        isValid(input: password, pattern: AppStringsManager.passwordPattern)) {
      signupObject = signupObject.copyWith(password: password);
    } else {
      signupObject = signupObject.copyWith(password: "");
    }
    inputPassword.add(password);
    _validator();
  }

  @override
  setConfirmPassword(String confirmPassword) {
    if (confirmPassword.isNotEmpty) {
      signupObject = signupObject.copyWith(confirmPassword: confirmPassword);
    } else {
      signupObject = signupObject.copyWith(confirmPassword: "");
    }
    inputConfirmPassword.add(confirmPassword);
    _validator();
  }

  @override
  setProfilePicture(File profilePicture) {
    if (profilePicture.path.isNotEmpty) {
      signupObject = signupObject.copyWith(profilePicture: profilePicture.path);
    } else {
      signupObject = signupObject.copyWith(profilePicture: "");
    }
    inputProfilePicture.add(profilePicture);
    _validator();
  }

  //Outputs

  @override
  Stream<String?> get outputFirstNameMessage =>
      _firstNameStreamController.stream.map((firstName) => _getEmptyErrMessage(
          input: firstName,
          errorMessage: AppStringsManager.firstNameErrorMessage.tr()));

  @override
  Stream<String?> get outputLastNameMessage =>
      _lastNameStreamController.stream.map((lastName) => _getEmptyErrMessage(
          input: lastName,
          errorMessage: AppStringsManager.lastNameErrorMessage.tr()));

  @override
  Stream<String?> get outputMobileNumberMessage =>
      _mobileNumberStreamController.stream.map((mobileNumber) =>
          _getEmptyValidationErrMessage(
              input: mobileNumber,
              errorMessage: AppStringsManager.mobileNumberErrorMessage.tr(),
              inValidMessage: AppStringsManager.mobileNumberInValidMessage.tr(),
              pattern: AppStringsManager.mobilePattern));

  @override
  Stream<String?> get outputEmailMessage => _emailStreamController.stream.map(
      (password) => _getEmptyValidationErrMessage(
          input: password,
          errorMessage: AppStringsManager.emailErrMassage.tr(),
          inValidMessage: AppStringsManager.emailInValidMessage.tr(),
          pattern: AppStringsManager.emailPattern));

  @override
  Stream<String?> get outputPasswordMessage => _passwordStreamController.stream
      .map((password) => _getEmptyValidationErrMessage(
          input: password,
          errorMessage: AppStringsManager.passwordErrorMessage.tr(),
          inValidMessage: AppStringsManager.passwordInValidMessage.tr(),
          pattern: AppStringsManager.passwordPattern));

  @override
  Stream<String?> get outputConfirmPasswordMessage =>
      _confirmPasswordStreamController.stream.map((confirmPassword) =>
          _getConfirmPasswordErrorMessage(confirmPassword));

  @override
  Stream<bool> get outputAreAllInputsValid =>
      areAllInputsValidStreamController.stream.map((_) => _areAllInputsValid());

  @override
  Stream<String> get outputFlag =>
      _flagStreamCodeController.stream.map((flag) => flag);

  @override
  signup() async {
    inputState.add(
        LoadingState(stateRendererType: StateRendererTypes.popupLoadingState));
    (await _useCase.execute(SignupUseCaseInput(
            signupObject.firstName,
            signupObject.lastName,
            signupObject.countryMobileCode,
            signupObject.mobileNumber,
            signupObject.email,
            signupObject.password,
            signupObject.confirmPassword,
            "")))
        .fold(
            (failure) => inputState.add(ErrorState(
                StateRendererTypes.popupErrorState, failure.message)), (data) {
      inputState.add(
          SuccessState(StateRendererTypes.popupSuccessState, data.message));
      inputIsUserRegisteredSuccessfully.add(true);
    });
  }

// Private methods
  String? _getEmptyValidationErrMessage(
      {required String input,
      required String errorMessage,
      required String inValidMessage,
      required String pattern}) {
    if (input.isEmpty) {
      return errorMessage.tr();
    } else if (!isValid(input: input, pattern: pattern)) {
      return inValidMessage.tr();
    }
    return null;
  }

  String? _getEmptyErrMessage(
          {required String input, required String errorMessage}) =>
      input.isNotEmpty ? null : errorMessage.tr();

  bool _isPasswordsMatch(String confirmPassword) {
    if (confirmPassword == signupObject.confirmPassword) {
      return true;
    } else {
      return false;
    }
  }

  String? _getConfirmPasswordErrorMessage(String confirmPassword) {
    if (confirmPassword.isNotEmpty) {
      return null;
    } else {
      return AppStringsManager.confirmPasswordErrorMessage.tr();
    }
  }

  bool _areAllInputsValid() {
    return signupObject.firstName.isNotEmpty &&
        signupObject.lastName.isNotEmpty &&
        signupObject.countryMobileCode.isNotEmpty &&
        signupObject.mobileNumber.isNotEmpty &&
        signupObject.email.isNotEmpty &&
        signupObject.password.isNotEmpty &&
        signupObject.confirmPassword.isNotEmpty &&
        signupObject.profilePicture.isNotEmpty;
  }

  _validator() {
    inputAreAllInputsValid.add(null);
  }

  @override
  Stream<File> get outputProfilePicture =>
      _profilePictureStreamController.stream.map((event) => event);

  @override
  Sink get inputIsUserRegisteredSuccessfully =>
      isUserRegisteredSuccessfully.sink;

  @override
  Stream<bool?> get outputIsUserRegisteredSuccessfully =>
      isUserRegisteredSuccessfully.stream.map((event) => event);
}
