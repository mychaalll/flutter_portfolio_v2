import 'package:flutter/material.dart';
import 'package:portfolio_v2/mobile/widgets/heading.dart';
import 'package:portfolio_v2/utils/responsive.dart';

class AboutMePage extends StatelessWidget {
  final double height;
  const AboutMePage({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    ResponsiveLayout responsiveLayout = ResponsiveLayout(context);
    String deviceType = responsiveLayout.getDeviceType();
    var contents = [
      Expanded(
        flex: 1,
        child: Container(
          child: Image.asset(
            'assets/images/formal-pic.JPG',
            filterQuality: FilterQuality.high,
            fit: BoxFit.fitWidth
          ),
        ),
      ),
      SizedBox(height: 20),
      Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'MYCHAL JANDRO ESUREÑA',
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 1.5,
                color: Colors.white,
                fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              'I am Mychal Jandro Esureña, a Computer Engineering graduate at the Polytechnic University of the Philippines. \n\nAt the age of 22, I have focused my efforts on the realm of software development, where I\'m currently engrossed in exploring the intricacies of Flutter to create user-friendly applications. As I approach the transition to the professional sphere, I am enthusiastic about contributing solutions that align with user preferences and enhance the technological landscape.',
              style: TextStyle(
                fontSize: 8,
                height: 1.5,
                color: Colors.white,
                fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      )
    ];

    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal:30),
      child: Column(
        children: [
          const SizedBox(height: 80),
          Heading(text: 'ABOUT ME'),
          const SizedBox(height: 40),
          Expanded(
            child:
              Column(
                 children: contents,
              ),
            ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}