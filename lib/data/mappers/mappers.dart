import 'package:flutter_advanced/application/constants.dart';
import 'package:flutter_advanced/application/extensions.dart';
import 'package:flutter_advanced/domain/models/models.dart';

import '../response/responses.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() => Customer(
      this?.id?.toZero() ?? Constants.kZero,
      this?.name.toEmpty() ?? Constants.kEmpty,
      this?.numOfNotifications.toZero() ?? Constants.kZero);
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() => Contacts(
      this?.email.toEmpty() ?? Constants.kEmpty,
      (this?.phone.toEmpty() ?? Constants.kEmpty),
      this?.link.toEmpty() ?? Constants.kEmpty);
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() => Authentication(
      this?.message.toEmpty() ?? Constants.kEmpty,
      this?.contacts.toDomain(),
      this?.customer.toDomain());
}

extension ForgetPasswordResponseMapper on ForgetPasswordResponse? {
  String toDomain() => this?.message.toEmpty() ?? Constants.kEmpty;
}

extension ServicesResponseMapper on ServicesResponse? {
  Services toDomain() => Services(
      this?.id.toZero() ?? Constants.kZero,
      this?.title.toEmpty() ?? Constants.kEmpty,
      this?.image.toEmpty() ?? Constants.kEmpty);
}

extension BannersResponseMapper on BannersResponse? {
  Banners toDomain() => Banners(
      this?.id.toZero() ?? Constants.kZero,
      this?.link.toEmpty() ?? Constants.kEmpty,
      this?.title.toEmpty() ?? Constants.kEmpty,
      this?.image.toEmpty() ?? Constants.kEmpty);
}

extension StoresResponseMapper on StoresResponse? {
  Stores toDomain() => Stores(
      this?.id.toZero() ?? Constants.kZero,
      this?.title.toEmpty() ?? Constants.kEmpty,
      this?.image.toEmpty() ?? Constants.kEmpty);
}

extension HomeDataResponseMapper on HomeDataResponse? {
  HomeData toDomain() {
    List<Services> services =
        (this?.dataResponse?.servicesResponse?.map((e) => e.toDomain()) ??
                const Iterable<Services>.empty())
            .cast<Services>()
            .toList();
    List<Banners> banners =
        (this?.dataResponse?.bannersResponse?.map((e) => e.toDomain()) ??
                const Iterable<Banners>.empty())
            .cast<Banners>()
            .toList();
    List<Stores> stores =
        (this?.dataResponse?.storesResponse?.map((e) => e.toDomain()) ??
                const Iterable<Stores>.empty())
            .cast<Stores>()
            .toList();

    Data data = Data(services, banners, stores);
    return HomeData(this?.message.toEmpty() ?? Constants.kEmpty, data);
  }
}

extension StoreDetailsResponseMapper on StoreDetailsResponse? {
  StoreDetails toDomain() => StoreDetails(
      this?.image.toEmpty() ?? Constants.kEmpty,
      this?.id.toZero() ?? Constants.kZero,
      this?.title.toEmpty() ?? Constants.kEmpty,
      this?.details.toEmpty() ?? Constants.kEmpty,
      this?.services.toEmpty() ?? Constants.kEmpty,
      this?.about.toEmpty() ?? Constants.kEmpty);
}
