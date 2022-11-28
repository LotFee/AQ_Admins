import 'package:aq_admin/injection_container.dart';
import 'package:aq_admin/service/navigations.service.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  initiate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) =>
          ResponsiveWrapper.builder(child, breakpoints: const [
        ResponsiveBreakpoint.resize(480, name: MOBILE),
        ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
      ]),
      routerConfig: NavigationService.getInstance().router,
    );
  }
}
