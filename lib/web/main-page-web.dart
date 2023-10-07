import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_v2/utils/colors.dart';
import 'package:portfolio_v2/utils/responsive.dart';
import 'package:portfolio_v2/web/about-me-page.dart';
import 'package:portfolio_v2/web/footer-page.dart';
import 'package:portfolio_v2/web/landing-page.dart';
import 'package:portfolio_v2/web/projects-page.dart';
import 'package:portfolio_v2/web/skills-page.dart';
import 'package:portfolio_v2/web/widgets/drawer.dart';
import 'package:portfolio_v2/web/widgets/navigation-buttons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainPageWeb extends StatefulWidget {
  const MainPageWeb({super.key});

  @override
  State<MainPageWeb> createState() => _MainPageWebState();
}

class _MainPageWebState extends State<MainPageWeb> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;
  int _currentIndex = 0;
  double _screenHeight = 0.0;

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
    if(_scrollPosition >= _screenHeight * 3){
      setState(() {
        _currentIndex = 3;
      });
    }
    else if(_scrollPosition >= _screenHeight * 2 - 5){
      setState(() {
        _currentIndex = 2;
      });
    }
    else if(_scrollPosition >= _screenHeight){
      setState(() {
        _currentIndex = 1;
      });
    }
    else{
      setState(() {
        _currentIndex = 0;
      });
    }
  }

 

  @override
  Widget build(BuildContext context) {
    
    
    double height = MediaQuery.of(context).size.height > 530 ? MediaQuery.of(context).size.height : 661;
    ResponsiveLayout responsiveLayout = ResponsiveLayout(context);
    String deviceType = responsiveLayout.getDeviceType();
    setState(() {
      _screenHeight = height;
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Colors.grey[900],
      appBar:AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black.withOpacity(0.6),
        elevation: 4,
        toolbarHeight: 60,
        title: Container(
          padding: EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: deviceType == 'web' ? MainAxisAlignment.start :MainAxisAlignment.center,
            children: [
              Text(
                'Mychal\'s Portfolio',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),
              ),
              deviceType == 'web' ? Spacer(): Container(),
              deviceType == 'web' ? Row(
                children: [
                  NavButtons(
                    text: 'HOME',
                    isActive: _currentIndex == 0 ? true : false,
                    onTap: (){
                      final double targetPosition = 0;
                      _scrollController.animateTo(
                        targetPosition, 
                        duration: Duration(milliseconds: 500), 
                        curve: Curves.easeOut);
                    },
                  ),
                  NavButtons(
                    text: 'ABOUT ME',
                    isActive: _currentIndex == 1 ? true : false,
                    onTap: (){
                      final double targetPosition = height;
                      _scrollController.animateTo(
                        targetPosition, 
                        duration: Duration(milliseconds: 500), 
                        curve: Curves.easeOut);
                    },
                  ),
                  NavButtons(
                    text: 'SKILLS',
                    isActive: _currentIndex == 2 ? true : false,
                    onTap: (){
                      final double targetPosition = height * 2 - 5;
                      _scrollController.animateTo(
                        targetPosition, 
                        duration: Duration(milliseconds: 500), 
                        curve: Curves.easeOut);
                    },
                  ),
                  NavButtons(
                    text: 'PROJECTS',
                    isActive: _currentIndex == 3 ? true : false,
                    onTap: (){
                      final double targetPosition = height * 3 ;
                      _scrollController.animateTo(
                        targetPosition, 
                        duration: Duration(milliseconds: 500), 
                        curve: Curves.easeOut);
                    },
                  ),
                 
                ],
              ): Container()
            ],
          ),
        ),
        // Display the drawer
      ),
      bottomNavigationBar: deviceType == 'web' ? null : Padding(
        padding: const EdgeInsets.only(
          bottom: 30, 
          left: 60,
          right: 60
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Color.fromARGB(255, 41, 0, 82).withOpacity(0.6)
          ),
          child: GNav(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            selectedIndex: _currentIndex,
            padding: EdgeInsets.all(15),
            tabBorderRadius: 60,
            iconSize: 20,
            gap: 10,
            activeColor: Colors.white,
            color: Colors.grey,
            onTabChange: (value){
              print(value);
              setState(() {
                _currentIndex = value;
              });
              switch (value){
                case 0:
                  final double targetPosition = 0;
                  _scrollController.animateTo(
                  targetPosition, 
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut);
                  break;
                case 1:
                  final double targetPosition = height;
                  _scrollController.animateTo(
                  targetPosition, 
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut);
                  break;
                case 2:
                  final double targetPosition = height * 2 - 5;
                  _scrollController.animateTo(
                  targetPosition, 
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut);
                  break;
                case 3:
                  final double targetPosition = height * 3;
                  _scrollController.animateTo(
                  targetPosition, 
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut);
                  break;
              }
            },
            tabs: [
              GButton(
                icon: Icons.home_filled,
                text: 'Home',
              ),
              GButton(
                icon: Icons.person_2_rounded,
                text: 'About me',
              ),
              GButton(
                icon: FontAwesomeIcons.cogs,
                gap: 15,
                text: 'Skills',
              ),
              GButton(
                icon: Icons.space_dashboard_rounded,
                text: 'Projects',
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
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
                color: Color.fromARGB(255, 15, 0, 17),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: (_scrollPosition / height).clamp(0.0, 1.0),
                  child: AboutMePage(height: height)
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.darken),
                    image: AssetImage('assets/images/purplewallpaper1.png'),
                    fit: BoxFit.cover
                  )
                ),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: ((_scrollPosition / height) - 1.0).clamp(0.0, 1.0),
                  child: SkillsPage(height: height)
                ),
              ),
              Container(
                color: Color.fromARGB(255, 15, 0, 17),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 500),
                  opacity: ((_scrollPosition / height) - 2.0).clamp(0.0, 1.0),
                  child: ProjectsPage(height: height),
                ),
              ),
              FooterPage(height: height,),
            ],
          ),
        )
      ),
      // endDrawer: deviceType == 'web' ? null : MyDrawer(controller: _scrollController, height: height)
    );
  }
}