import 'package:dio/dio.dart';
import 'package:flutter_advanced/application/app_preferences.dart';
import 'package:flutter_advanced/data/local/data_sources/local_data_source.dart';
import 'package:flutter_advanced/data/network/app_service.dart';
import 'package:flutter_advanced/data/network/dio_factory.dart';
import 'package:flutter_advanced/data/network/network_info.dart';
import 'package:flutter_advanced/data/remote/data_sources/remote_data_source.dart';
import 'package:flutter_advanced/data/repositories/repositry_impl.dart';
import 'package:flutter_advanced/domain/repositories/repositories.dart';
import 'package:flutter_advanced/domain/use_cases/get_home_data_use_case.dart';
import 'package:flutter_advanced/domain/use_cases/login_use_case.dart';
import 'package:flutter_advanced/domain/use_cases/reset_password_use_case.dart';
import 'package:flutter_advanced/domain/use_cases/signup_use_case.dart';
import 'package:flutter_advanced/domain/use_cases/store_details_use_case.dart';
import 'package:flutter_advanced/presentation/login/view_model/login_view_model.dart';
import 'package:flutter_advanced/presentation/main/home/viewmodel/home_view_model.dart';
import 'package:flutter_advanced/presentation/sign_up/view_model/signup_view_model.dart';
import 'package:flutter_advanced/presentation/store_details/view_model/store_details_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/forgot_password/forgot_password_view_model.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // Shared preference instance
  SharedPreferences sharedPref = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPref);

  //App preference instance
  instance.registerLazySingleton<AppPreferences>(
          () => AppPreferences(instance<SharedPreferences>()));
  //Internet Info  instance

  instance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnectionChecker()));

  // Dio Factory instance
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));
  // App Service  Client instance
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));
  // Remote Data source instance
  instance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(instance()));
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
// Repository instance
  instance.registerLazySingleton<Repository>(
          () => RepositoryImpl(instance(), instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginViewModel>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initSignupModule() {
  if (!GetIt.I.isRegistered<SignupViewModel>()) {
    instance.registerFactory<SignupUseCase>(() => SignupUseCase(instance()));
    instance
        .registerFactory<SignupViewModel>(() => SignupViewModel(instance()));
    instance.registerFactory<ImagePicker>(() => ImagePicker());
  }
}

initForgetPasswordModule() {
  if (!GetIt.I.isRegistered<ForgetPasswordViewModel>()) {
    instance.registerFactory<ResetPasswordUseCase>(
            () => ResetPasswordUseCase(instance()));
    instance.registerFactory<ForgetPasswordViewModel>(
            () => ForgetPasswordViewModel(instance()));
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeViewModel>()) {
    instance
        .registerFactory<HomeDataUseCase>(() => HomeDataUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}

initStoreDetailsModule() {
  if (!GetIt.I.isRegistered<StoreDetailsViewModel>()) {
    instance
        .registerFactory<StoreDetailsUseCase>(() =>
        StoreDetailsUseCase(instance()));
    instance.registerFactory<StoreDetailsViewModel>(() =>
        StoreDetailsViewModel(instance()));
  }
}