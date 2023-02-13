import 'package:dio/dio.dart';
import 'package:flutter_advanced/application/constants.dart';
import 'package:flutter_advanced/data/response/responses.dart';
import 'package:retrofit/http.dart';

part 'app_service.g.dart';

@RestApi(baseUrl: Constants.kBaseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String? baseUrl}) = _AppServiceClient;

  @POST("customers/login")
  Future<AuthenticationResponse> login(
      @Field("email") String email, @Field("password") String password);

  @POST("customers/reset-password")
  Future<ForgetPasswordResponse> forgetPassword(@Field("email") String email);

  @POST("customers/signup")
  Future<AuthenticationResponse> signup(
      @Field("firstName") String firstName,
      @Field("lastName") String lastName,
      @Field("countryMobileCode") String countryMobileCode,
      @Field("mobileNumber") String mobileNumber,
      @Field("email") String email,
      @Field("password") String password,
      @Field("confirmPassword") String confirmPassword,
      @Field("profilePicture") String profilePicture);

  @GET("/home")
  Future<HomeDataResponse> getHomeData();
}
