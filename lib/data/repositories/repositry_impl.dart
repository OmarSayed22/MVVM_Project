import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_advanced/data/mappers/mappers.dart';
import 'package:flutter_advanced/data/network/failure.dart';
import 'package:flutter_advanced/data/network/network_info.dart';
import 'package:flutter_advanced/data/network/requests.dart';
import 'package:flutter_advanced/data/remote/data_sources/remote_data_source.dart';
import 'package:flutter_advanced/domain/models/models.dart';

import '../../domain/repositories/repositories.dart';
import '../local/data_sources/local_data_source.dart';
import '../network/error_handler.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final LocalDataSource _localDataSource;

  RepositoryImpl(
      this._remoteDataSource, this._networkInfo, this._localDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    // check if the internet is already existing
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.success) {
          // success
          //return data
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unknown));
        }
      } catch (error) {
        if (kDebugMode) {
          print("Error ${error.toString()}");
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    }

    //has internet connection
    else {
      //don't has internet connection
      return Left(DataSources.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> resetPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.forgetPassword(email);
        if (response.status == ApiInternalStatus.success) {
          // success
          //return data
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unknown));
        }
      } catch (error) {
        if (kDebugMode) {
          print("Error ${error.toString()}");
        }
        return Left(ErrorHandler.handle(error).failure);
      }
    }

    //has internet connection
    else {
      //don't has internet connection
      return Left(DataSources.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> signup(
      SignupRequest signupRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.signup(signupRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(ApiInternalStatus.failure,
              response.message ?? ResponseMessage.unknown));
        }
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSources.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, HomeData>> getHomeData() async {
    try {
      // if Local data source have home data and it is valid
      final response = await _localDataSource.getHomeData();
      return Right(response.toDomain());
    } catch (cacheError) {
      // if Local data source don't have home data or it isn't valid
      if (await _networkInfo.isConnected) {
        try {
          final response = await _remoteDataSource.getHomeData();
          if (response.status == ApiInternalStatus.success) {
            await _localDataSource.saveHomeDataResponseToCache(response);
            return Right(response.toDomain());
          } else {
            return left(Failure(ApiInternalStatus.failure,
                response.message ?? ResponseMessage.unknown));
          }
        } catch (error) {
          return left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataSources.noInternetConnection.getFailure());
      }
    }
  }
}
