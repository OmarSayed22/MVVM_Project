import 'package:flutter_advanced/data/network/app_service.dart';
import 'package:flutter_advanced/data/network/requests.dart';

import '../../response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<ForgetPasswordResponse> forgetPassword(String email);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password);
  }

  @override
  Future<ForgetPasswordResponse> forgetPassword(String email) async {
    return await _appServiceClient.forgetPassword(email);
  }
}
