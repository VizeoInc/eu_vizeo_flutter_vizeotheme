import 'package:flutter/material.dart';

enum VzTextType {
  typePrimary,
  typeSecondary,
  typeTertiary,
}

enum TypeDeTextStyle {
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  body1,
  body2,
  body3,
}

extension TypeDeStyleExt on TypeDeTextStyle {
  TextStyle get textStyle {
    switch (this) {
      case TypeDeTextStyle.h1:
        return const TextStyle(
          fontSize: 55,
          fontWeight: FontWeight.w700,
        );
      case TypeDeTextStyle.h2:
        return const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w700,
        );
      case TypeDeTextStyle.h3:
        return const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
        );
      case TypeDeTextStyle.h4:
        return const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w700,
        );
      case TypeDeTextStyle.h5:
        return const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        );
      case TypeDeTextStyle.h6:
        return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        );
      case TypeDeTextStyle.body1:
        return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        );
      case TypeDeTextStyle.body2:
        return const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        );
      case TypeDeTextStyle.body3:
        return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        );
      default:
        return const TextStyle();
    }
  }
}

enum VzTextFormType {
  mail,
  password,
  telephone,
  general,
}
