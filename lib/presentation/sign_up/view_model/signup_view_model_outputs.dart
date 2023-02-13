import 'dart:io';

abstract class SignupViewModelOutputs {
  Stream<String?> get outputFirstNameMessage;

  Stream<String?> get outputLastNameMessage;

  Stream<String> get outputFlag;

  Stream<String?> get outputMobileNumberMessage;

  Stream<String?> get outputEmailMessage;

  Stream<String?> get outputPasswordMessage;

  Stream<String?> get outputConfirmPasswordMessage;

  Stream<File> get outputProfilePicture;

  Stream<bool?> get outputAreAllInputsValid;

  Stream<bool?> get outputIsUserRegisteredSuccessfully;
}
