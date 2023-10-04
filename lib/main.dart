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
      title: 'Portfolio | Mychal Esureña',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 36, 36, 36)),
        useMaterial3: true,
      ),
      
      home: 
        ResponsiveLayout(context).getDeviceType() == 'web' ? MainPageWeb()
        : ResponsiveLayout(context).getDeviceType() == 'tablet' ? MainPageTablet()
        : MainPageMobile() 
    );
  }
}

