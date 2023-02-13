import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/data/network/failure.dart';
import 'package:flutter_advanced/data/network/requests.dart';
import 'package:flutter_advanced/domain/models/models.dart';
import 'package:flutter_advanced/domain/repositories/repositories.dart';

import 'base_use_case.dart';

class SignupUseCase implements BaseUseCase<SignupUseCaseInput, Authentication> {
  final Repository _repository;

  SignupUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
          SignupUseCaseInput input) async =>
      await _repository.signup(SignupRequest(
          input.firstName,
          input.lastName,
          input.countryMobileCode,
          input.mobileNumber,
          input.email,
          input.password,
          input.confirmPassword,
          input.profilePicture));
}

class SignupUseCaseInput {
  String firstName;
  String lastName;
  String countryMobileCode;
  String mobileNumber;
  String email;
  String password;
  String confirmPassword;
  String profilePicture;

  SignupUseCaseInput(
      this.firstName,
      this.lastName,
      this.countryMobileCode,
      this.mobileNumber,
      this.email,
      this.password,
      this.confirmPassword,
      this.profilePicture);
}
