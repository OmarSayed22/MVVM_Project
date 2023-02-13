class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class SignupRequest {
  String firstName;
  String lastName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;
  String confirmPassword;
  String profilePicture;

  SignupRequest(
      this.firstName,
      this.lastName,
      this.countryMobileCode,
      this.mobileNumber,
      this.email,
      this.password,
      this.confirmPassword,
      this.profilePicture);
}
