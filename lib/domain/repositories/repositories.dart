import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/domain/models/models.dart';
import '../../data/network/failure.dart';
import '../../data/network/requests.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
