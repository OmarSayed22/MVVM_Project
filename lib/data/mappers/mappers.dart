import 'package:flutter_advanced/application/constants.dart';
import 'package:flutter_advanced/application/extensions.dart';
import 'package:flutter_advanced/domain/models/models.dart';

import '../response/responses.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() => Customer(
      this?.id.toZero() ?? Constants.zero,
      this?.name.toEmpty() ?? Constants.empty,
      this?.noOfNotifications.toZero() ?? Constants.zero);
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() => Contacts(
      this?.email.toEmpty() ?? Constants.empty,
      this?.phone.toZero() ?? Constants.zero,
      this?.link.toEmpty() ?? Constants.empty);
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() =>
      Authentication(this?.contacts.toDomain(), this?.customer.toDomain());
}
