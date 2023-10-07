import 'package:flutter/material.dart';
import 'package:portfolio_v2/mobile/main-page-mobile.dart';
import 'package:portfolio_v2/utils/responsive.dart';
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
        
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 36, 36, 36)),
        useMaterial3: true,
      ),
      
      home: ResponsiveLayout(context).getDeviceType() == 'mobile' ? MainPageMobile()  
        : MainPageWeb()
        
    );
  }
}


