import 'package:flutter/material.dart';

abstract class KSizedBox {
  static const SizedBox kHeightSizedBox40 = SizedBox(
    height: 40,
  );
  static const SizedBox kHeightSizedBox30 = SizedBox(
    height: 30,
  );
  static const SizedBox kHeightSizedBox20 = SizedBox(
    height: 20,
  );
  static const SizedBox kHeightSizedBox15 = SizedBox(
    height: 15,
  );
  static const SizedBox kHeightSizedBox5 = SizedBox(
    height: 5,
  );
  static const SizedBox kWidthSizedBox15 = SizedBox(
    width: 15,
  );
}

final BorderRadius kBorderRadius = BorderRadius.circular(15.0);

abstract class KPadding {
  static const kPaddingSize10 = 10.0;
  static const kPaddingSize15 = 15.0;
  static const kPaddingSize5 = 5.0;
}

abstract class KPixel {
  static const kPixel50 = 50.0;
  static const kPixel100 = 100.0;
  static const kPixel200 = 200.0;
}
