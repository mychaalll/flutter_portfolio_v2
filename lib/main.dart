import 'package:flutter/material.dart';
import 'package:portfolio_v2/mobile/main-page-mobile.dart';
import 'package:portfolio_v2/tablet/main-page-tablet.dart';
import 'package:portfolio_v2/utils/responsive.dart';
import 'package:portfolio_v2/utils/theme/dark-theme.dart';
import 'package:portfolio_v2/utils/theme/light-theme.dart';
import 'package:portfolio_v2/web/main-page-web.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      
      home: 
        ResponsiveLayout(context).getDeviceType() == 'web' ? MainPageWeb()
        : ResponsiveLayout(context).getDeviceType() == 'tablet' ? MainPageTablet()
        : MainPageMobile() 
    );
  }
}

