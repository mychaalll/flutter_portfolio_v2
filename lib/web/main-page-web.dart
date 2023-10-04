import 'package:flutter/material.dart';
import 'package:portfolio_v2/utils/colors.dart';
import 'package:portfolio_v2/utils/responsive.dart';
import 'package:portfolio_v2/web/about-me-page.dart';
import 'package:portfolio_v2/web/landing-page.dart';
import 'package:portfolio_v2/web/skills-page.dart';
import 'package:portfolio_v2/web/widgets/navigation-buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPageWeb extends StatefulWidget {
  const MainPageWeb({super.key});

  @override
  State<MainPageWeb> createState() => _MainPageWebState();
}

class _MainPageWebState extends State<MainPageWeb> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.offset;
    });
    print(' scroll pos $_scrollPosition');
    print('normal div ${(_scrollPosition / 661) - 1.0}');
    print(((_scrollPosition / 661) - 1.0).clamp(0.0, 1.0),);
  }

 

  @override
  Widget build(BuildContext context) {
    
    double height = MediaQuery.of(context).size.height;
    ResponsiveLayout responsiveLayout = ResponsiveLayout(context);
    String deviceType = responsiveLayout.getDeviceType();

    
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[900],
      appBar:AppBar(
        backgroundColor: Colors.black.withOpacity(0.6),
        elevation: 4,
        toolbarHeight: 60,
        title: Container(
          padding: EdgeInsets.all(30),
          child: Row(
            children: [
              Text(
                height.toString(),
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
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
        top:false,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: 1.0,
                child: LandingPage(height: height),
              ),
              Container(
                color: Colors.black,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: (_scrollPosition / height).clamp(0.0, 1.0),
                  child: AboutMePage(height: height)
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                    image: AssetImage('assets/images/polygon-bg2.jpg'),
                    fit: BoxFit.cover
                  )
                ),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: ((_scrollPosition / 661) - 1.0).clamp(0.0, 1.0),
                  child: SkillsPage(height: height)
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}