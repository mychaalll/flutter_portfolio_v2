import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/utils/colors.dart';

class AboutMePage extends StatelessWidget {
  final double height;
  const AboutMePage({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Row(
        children: [
          Spacer(flex: 1,),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                const SizedBox(height: 60),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 5,
                      decoration: BoxDecoration(
                        color: AppColors.purple,
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'ABOUT ME',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Image.asset(
                            'assets/images/formal-pic.JPG',
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fitHeight
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                'I am Mychal Jandro Esureña, a Computer Engineering graduate at the Polytechnic University of the Philippines. \n\nAt the age of 21, I have focused my efforts on the realm of software development, where I\'m currently engrossed in exploring the intricacies of Flutter to create user-friendly applications. As I approach the transition to the professional sphere, I am enthusiastic about contributing solutions that align with user preferences and enhance the technological landscape.',
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 1.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        )
                      )
                    ],
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