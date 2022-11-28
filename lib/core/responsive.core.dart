import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

int responsiveNumber(BuildContext context, int mobile, int tablet, int web) {
  if (ResponsiveWrapper.of(context).isSmallerThan(TABLET)) return mobile;
  if (ResponsiveWrapper.of(context).isSmallerThan(DESKTOP)) return tablet;
  return web;
}
