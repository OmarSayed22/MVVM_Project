import 'package:flutter_advanced/data/network/app_service.dart';
import 'package:flutter_advanced/data/network/requests.dart';

import '../../response/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);

  Future<ForgetPasswordResponse> forgetPassword(String email);

  Future<AuthenticationResponse> signup(SignupRequest signupRequest);

  Future<HomeDataResponse> getHomeData();

  Future<StoreDetailsResponse> getStoreDetails();
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

  @override
  Future<AuthenticationResponse> signup(SignupRequest signupRequest) async {
    return await _appServiceClient.signup(
        signupRequest.firstName,
        signupRequest.lastName,
        signupRequest.countryMobileCode,
        signupRequest.mobileNumber,
        signupRequest.email,
        signupRequest.password,
        signupRequest.confirmPassword,
        signupRequest.profilePicture);
  }

  @override
  Future<HomeDataResponse> getHomeData() async {
    return await _appServiceClient.getHomeData();
  }

  @override
  Future<StoreDetailsResponse> getStoreDetails() async {
    return await _appServiceClient.getStoreDetails();
  }
}
