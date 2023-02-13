import 'package:analyzer/file_system/file_system.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_class.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String userName, String password) = _LoginObject;
}

@freezed
class EmailObject with _$EmailObject {
  factory EmailObject(String email) = _EmailObject;
}

@freezed
class SignupObject with _$SignupObject {
  factory SignupObject(
    String firstName,
    String lastName,
    String countryMobileCode,
    String mobileNumber,
    String email,
    String password,
    String confirmPassword,
    String profilePicture,
  ) = _SignupObject;
}
