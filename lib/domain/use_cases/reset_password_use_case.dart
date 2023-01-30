import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/data/network/failure.dart';
import 'package:flutter_advanced/domain/repositories/repositories.dart';
import 'package:flutter_advanced/domain/use_cases/base_use_case.dart';

class ResetPasswordUseCase
    implements BaseUseCase<ResetPasswordUseCaseInput, String> {
  final Repository _repository;

  ResetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(
      ResetPasswordUseCaseInput input) async {
    return await _repository.resetPassword(input.email);
  }
}

class ResetPasswordUseCaseInput {
  String email;

  ResetPasswordUseCaseInput(this.email);
}
