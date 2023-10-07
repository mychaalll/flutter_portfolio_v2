import 'package:flutter/material.dart';
import 'package:portfolio_v2/utils/colors.dart';
import 'package:portfolio_v2/web/widgets/navigation-buttons.dart';

class MyDrawer extends StatelessWidget {
  final double height;
  final ScrollController controller;

  const MyDrawer({super.key, required this.controller, required this.height});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 36, 1, 71).withOpacity(0.6),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal:10.0,
          vertical: 50.0
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            NavButtons(
              text: 'HOME',
              onTap: (){
                final double targetPosition = 0;
                controller.animateTo(
                  targetPosition, 
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut);
              },
            ),
            const SizedBox(height: 20,),
            NavButtons(
              text: 'ABOUT ME',
              onTap: (){
                final double targetPosition = height;
                controller.animateTo(
                  targetPosition, 
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut);
              },
            ),
            const SizedBox(height: 20,),
            NavButtons(
              text: 'SKILLS',
              onTap: (){
                final double targetPosition = height * 2 - 5;
                controller.animateTo(
                  targetPosition, 
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut);
              },
            ),
            const SizedBox(height: 20,),
            NavButtons(
              text: 'PROJECTS',
              onTap: (){
                final double targetPosition = height * 3 ;
                controller.animateTo(
                  targetPosition, 
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut);
              },
                  ),
            
          ],
        ),
      ),
    );
  }
}