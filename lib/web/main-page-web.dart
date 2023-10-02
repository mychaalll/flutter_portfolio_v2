import 'package:flutter/material.dart';
import 'package:portfolio_v2/utils/colors.dart';
import 'package:portfolio_v2/utils/responsive.dart';
import 'package:portfolio_v2/web/landing-page.dart';
import 'package:portfolio_v2/web/widgets/navigation-buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPageWeb extends StatelessWidget {
  const MainPageWeb({super.key});
  

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    ResponsiveLayout responsiveLayout = ResponsiveLayout(context);
    String deviceType = responsiveLayout.getDeviceType();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        title: Container(
          padding: EdgeInsets.all(30),
          child: Row(
            children: [
              Text(
                'Mychal\'s Portfolio',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),
              ),
              Spacer(),
              Row(
                children: [
                  NavButtons(
                    text: 'HOME',
                    onTap: (){
                      
                    },
                  ),
                  NavButtons(
                    text: 'ABOUT ME',
                    onTap: (){
                      
                    },
                  ),
                  NavButtons(
                    text: 'SKILLS',
                    onTap: (){
                      
                    },
                  ),
                  NavButtons(
                    text: 'PROJECTS',
                    onTap: (){
                      
                    },
                  ),
                 
                ],
              )
            ],
          ),
        ),
        // Display the drawer
        
      ),
      body: SafeArea(
      
        
        child: LandingPage(height: height),
      ),
    );
  }
}