import 'package:flutter_advanced/application/constants.dart';
import 'package:flutter_advanced/application/extensions.dart';
import 'package:flutter_advanced/domain/models/models.dart';

import '../response/responses.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() => Customer(
      this?.id.toEmpty() ?? Constants.empty,
      this?.name.toEmpty() ?? Constants.empty,
      this?.numOfNotifications.toZero() ?? Constants.zero);
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() => Contacts(
      this?.email.toEmpty() ?? Constants.empty,
      (this?.phone.toEmpty() ?? Constants.empty),
      this?.link.toEmpty() ?? Constants.empty);
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() =>
      Authentication(this?.contacts.toDomain(), this?.customer.toDomain());
}

extension ForgetPasswordResponseMapper on ForgetPasswordResponse? {
  String toDomain() => this?.message.toEmpty() ?? Constants.empty;
}
