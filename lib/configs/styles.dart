import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'sizes.dart';

class GeneralStyles {

  static const TextStyle label = TextStyle(
    fontSize: Sizes.fontLabelGeneral
  );

  static const TextStyle boldLabel = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Sizes.fontLabelGeneral
  );

  static TextStyle titleGeneral = label.copyWith(
    fontSize: Sizes.fontLabelGeneral,
    color: ColorConstants.greyDark,
    fontWeight: FontWeight.bold
  );

  static TextStyle subtitle = label.copyWith(
    fontSize: Sizes.fontLabelGeneral,
    fontWeight: FontWeight.bold
  );

}