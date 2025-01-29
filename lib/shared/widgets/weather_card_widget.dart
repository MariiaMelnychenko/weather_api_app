import 'package:flutter/material.dart';
import 'package:weather_app/shared/constants/constants.dart';

class WeatherCardWidget extends StatelessWidget {
  const WeatherCardWidget({
    required this.formattedDate,
    required this.day,
    super.key,
  });

  final Map<String, dynamic> day;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        color: AppColors.black54,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: KPadding.kPaddingSize10,
          horizontal: KPadding.kPaddingSize15,
        ),
        child: Row(
          children: [
            Image.network(
              'https:${day['icon']}',
              width: KPixel.kPixel50,
            ),
            KSizedBox.kWidthSizedBox15,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    formattedDate,
                    style: AppTextStyle.kText15,
                  ),
                  Text(
                    '🌡 Max: ${day['maxTemperature'].round()}°C | Min: ${day['minTemperature'].round()}°C',
                    style: AppTextStyle.kText15,
                  ),
                  Text(
                    '💧 Humidity: ${day['humidity'].toStringAsFixed(1)}%',
                    style: AppTextStyle.kText15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
