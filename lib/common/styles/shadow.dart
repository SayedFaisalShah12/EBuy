import 'package:flutter/cupertino.dart';
import '../../utils/constants/color.dart';

class EShadowStyle{
  ///for vertical shadow
  static final verticalProductShadow = BoxShadow(
    color: EColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0,2),
  );

  ///for horizontal shadow
  static final horizentalProductShadow = BoxShadow(
    color: EColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0,2),
  );
}