import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/utils/colors.dart';
import 'package:portfolio_v2/utils/responsive.dart';
import 'package:portfolio_v2/web/widgets/heading.dart';

class AboutMePage extends StatelessWidget {
  final double height;
  const AboutMePage({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    ResponsiveLayout responsiveLayout = ResponsiveLayout(context);
    String deviceType = responsiveLayout.getDeviceType();
    

    return Container(
      height: height,
      child: Row(
        children: [
          Spacer(flex: 1,),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                const SizedBox(height: 80),
                Heading(text: 'ABOUT ME'),
                const SizedBox(height: 40),
                Expanded(
                  child: Container(
                    child:  deviceType == 'web' ? Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Image.asset(
                              'assets/images/formal-pic.JPG',
                              filterQuality: FilterQuality.high,
                              fit: deviceType == 'web' ? BoxFit.fitHeight : BoxFit.fitWidth
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 5,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: deviceType == 'web' ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'MYCHAL JANDRO ESUREÑA',
                                  style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 1.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                Text(
                                  'I am Mychal Jandro Esureña, a Computer Engineering graduate at the Polytechnic University of the Philippines. \n\nAt the age of 22, I have focused my efforts on the realm of software development, where I\'m currently engrossed in exploring the intricacies of Flutter to create user-friendly applications. As I approach the transition to the professional sphere, I am enthusiastic about contributing solutions that align with user preferences and enhance the technological landscape.',
                                  style: TextStyle(
                                    fontSize: 14,
                                    height: 1.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                          )
                        )
                      ]
                    ):
                    Column(
                      children: [
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
                                  fontSize: 20,
                                  letterSpacing: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Text(
                                'I am Mychal Jandro Esureña, a Computer Engineering graduate at the Polytechnic University of the Philippines. \n\nAt the age of 22, I have focused my efforts on the realm of software development, where I\'m currently engrossed in exploring the intricacies of Flutter to create user-friendly applications. As I approach the transition to the professional sphere, I am enthusiastic about contributing solutions that align with user preferences and enhance the technological landscape.',
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        )
    ]
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Spacer(flex: 1,),
        ],
      ),
    );
  }
}

