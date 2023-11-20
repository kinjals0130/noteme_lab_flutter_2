import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../common/constants.dart';

InputDecoration inputDecoration(
    BuildContext context, {
      Widget? prefixIcon,
      String? labelText,
      double? borderRadius,
      Color? fillColor,
    }) {

  return InputDecoration(
    contentPadding:
    const EdgeInsets.only(left: 12, bottom: 10, top: 10, right: 10),
    labelText: labelText,
    // labelStyle: secondaryTextStyle(),
    labelStyle: const TextStyle(fontSize: 20.0, color: Colors.black38),
    alignLabelWithHint: true,
    prefixIcon: prefixIcon,
    enabledBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: const BorderSide(color: primaryColor, width: 0.0),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: const BorderSide(color: Colors.redAccent, width: 0.0),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: const BorderSide(color: Colors.red, width: 1.0),
    ),

    errorMaxLines: 2,
    border: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: const BorderSide(color: primaryColor, width: 0.0),
    ),

    disabledBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: const BorderSide(color: primaryColor, width: 0.0),
    ),

    errorStyle: primaryTextStyle(color: Colors.red, size: 12),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius(borderRadius ?? defaultRadius),
      borderSide: const BorderSide(color: primaryColor, width: 0.0),
    ),

    filled: true,
    fillColor: fillColor ?? context.cardColor,
  );
}
