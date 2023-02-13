import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/data/network/failure.dart';
import 'package:flutter_advanced/domain/models/models.dart';
import 'package:flutter_advanced/domain/use_cases/base_use_case.dart';

import '../repositories/repositories.dart';

class HomeDataUseCase implements BaseUseCase<void, HomeData> {
  final Repository _repository;

  HomeDataUseCase(this._repository);

  @override
  Future<Either<Failure, HomeData>> execute(void i) async {
    return await _repository.getHomeData();
  }
}
