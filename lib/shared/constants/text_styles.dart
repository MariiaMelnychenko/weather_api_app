import 'package:flutter/material.dart';
import 'package:weather_app/shared/shared.dart';

abstract class AppTextStyle {
  static const kText40 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: 'Gilroy',
    fontStyle: FontStyle.normal,
    color: AppColors.white,
  );

  static const kText30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: 'Gilroy',
    fontStyle: FontStyle.normal,
    color: AppColors.white,
  );

  static const kTextOrange30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: 'Gilroy',
    fontStyle: FontStyle.normal,
    color: AppColors.orange,
  );

  static const kText18 = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 18,
    color: AppColors.lightGrey,
  );

  static const kText15 = TextStyle(
    fontFamily: 'Gilroy',
    fontSize: 15,
    color: AppColors.lightGrey,
  );
}
