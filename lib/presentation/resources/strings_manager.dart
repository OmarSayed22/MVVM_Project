class AppStringsManager {
  static const noRouteFound = "no_route_found";
  static const onBoardingTitle1 = "on_boarding_title1";
  static const onBoardingTitle2 = "on_boarding_title2";
  static const onBoardingTitle3 = "on_boarding_title3";
  static const onBoardingTitle4 = "on_boarding_title4";
  static const onBoardingSubTitle1 = "on_boarding_desc1";
  static const onBoardingSubTitle2 = "on_boarding_desc2";
  static const onBoardingSubTitle3 = "on_boarding_desc3";
  static const onBoardingSubTitle4 = "on_boarding_desc4";
  static const skip = 'skip';
  static const passwordErrorMessage = "invalid_password";
  static const username = 'username_hint';
  static const password = 'password_hint';
  static const login = 'login_button';
  static const forgetPassword = 'forgot_password_text';
  static const signUp = 'register_text';
  static const loading = "loading";
  static const retryAgain = "retry_again";
  static const error = "error_occurred";
  static const ok = "ok";
  static const firstNameErrorMessage = "invalid_first_name";
  static const lastNameErrorMessage = "invalid_last_name";
  static const signup = "signup";
  static const mobileNumberInValidMessage = 'invalid_mobile_number';
  static const emailInValidMessage = 'invalid_email';
  static const alreadyHaveAccount = "already_have_account";
  static const profilePicture = "upload_profile_picture";
  static const uploadProfilePicture = "upload_profile_picture";
  static const photoFromGallery = 'photo_gallery';
  static const photoFromCamera = 'camera';
  static const mobileNumber = "mobile_number_hint";
  static const email = "email_hint";
  static const notification = "notification";
  static const search = "search";
  static const home = "home";
  static const settings = "settings";
  static const services = "services";
  static const stores = "stores";
  static const aboutStore = "about";
  static const details = "details";
  static const storeDetails = "store_details";
  static const success = "success";
  static const badRequest = "bad_request_error";
  static const forbidden = "forbidden_error";
  static const unauthorised = "unauthorized_error";
  static const notFound = "not_found_error";
  static const internetServerError = "internal_server_error";
  static const unknown = "unknown_error";
  static const connectTimeout = "timeout_error";
  static const cacheError = "cache_error";
  static const noInternetConnection = "no_internet_error";
  static const noContent = "no_content";
  static const changeLanguage = "change_language";
  static const inviteYourFriends = "invite_your_friends";
  static const contactUs = "contact_us";
  static const logout = "logout";
  static const resetPassword = "reset_password";

  static const loginErrMassage = 'login_error_massage';
  static const firstName = "first_name";
  static const lastName = "last_name";
  static const countryMobileCode = "country_mobile_code";

  static const confirmPassword = "confirm_password";

  // Error messages
  static const countryMobileCodeErrorMessage = "countryMobileCodeErrorMessage";
  static const mobileNumberErrorMessage = "mobile_number_error_message";
  static const emailErrMassage = "email_error_massage";

  static const confirmPasswordErrorMessage = "confirm_password_error_massage";
  static const profilePictureErrMassage = "profile_picture_error_massage";

  //InValidMessages

  static const passwordInValidMessage = "password_invalid_message";

  //  'Password must be include at least one uppercase,one lowercase ,one numeric number and one special letter common allow letter ( ! @ # \$ & * ~ ) ';
  static const confirmPasswordInValidMessage =
      "confirm_password_invalid_message";

  static const String cancel = "Request was canceled, please try again later";
  static const String receiveTimeout = "receive_timeout";
  static const String sendTimeout = "send_timeout";

  // Regular expression Patterns
  static const mobilePattern = r'^(?:[+0][1-9])?[0-9]{11}$';
  static const passwordPattern = r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)";
  static const emailPattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
}
