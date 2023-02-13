import 'dart:io';

abstract class SignupViewModelInputs {
  signup();

  setFlag(String flag);

  setFirstName(String firstName);

  setLastName(String lastName);

  setCountryMobileCode(String countryMobileCode);

  setMobileNumber(String mobileNumber);

  setEmail(String email);

  setPassword(String password);

  setConfirmPassword(String confirmPassword);

  setProfilePicture(File profilePicture);

  Sink get inputFirstName;

  Sink get inputLastName;

  Sink get inputFlag;

  Sink get inputMobileNumber;

  Sink get inputEmail;

  Sink get inputPassword;

  Sink get inputConfirmPassword;

  Sink get inputProfilePicture;

  Sink get inputAreAllInputsValid;

  Sink get inputIsUserRegisteredSuccessfully;
}
