import 'package:flutter_advanced/application/constants.dart';

extension NonNullString on String? {
  String toEmpty() => this == null ? Constants.kEmpty : this!;
}

extension NonNullInteger on int? {
  int toZero() => this == null ? Constants.kZero : this!;
}
