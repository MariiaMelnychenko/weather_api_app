import 'package:flutter/material.dart';
import 'package:weather_app/shared/shared.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'K',
          style: AppTextStyle.kTextOrange30,
        ),
        Text(
          'evych Solutions',
          style: AppTextStyle.kText30,
        ),
      ],
    );
  }
}
