import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/data/network/failure.dart';
import 'package:flutter_advanced/domain/models/models.dart';
import 'package:flutter_advanced/domain/repositories/repositories.dart';
import 'package:flutter_advanced/domain/use_cases/base_use_case.dart';

class StoreDetailsUseCase implements BaseUseCase<void, StoreDetails> {
  final Repository _repository;

  StoreDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, StoreDetails>> execute(void input) async {
    return await _repository.getStoreDetails();
  }
}
