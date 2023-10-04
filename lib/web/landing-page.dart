import 'package:flutter/material.dart';
import 'package:portfolio_v2/utils/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

class LandingPage extends StatelessWidget {
  final double height;
  LandingPage({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
          image: AssetImage('images/purplewallpaper1.png'),
          fit: BoxFit.cover
        )
      ),
      child: Row(
        children: [
          Spacer(
            flex: 1
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hey there,',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400],
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            'I\'m Mychal Esureña',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 5,
                                decoration: BoxDecoration(
                                  color: AppColors.purple,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                
                              ),
                              SizedBox(width: 5),
                              Column(
                                children: [
                                  AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      TyperAnimatedText(
                                        'an Application Developer',
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                        ),
                                        speed: Duration(milliseconds: 50),
                                        curve: Curves.easeIn,
                                      ),
                                      TyperAnimatedText(
                                        'a Software Developer',
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                        ),
                                        speed: Duration(milliseconds: 50),
                                        curve: Curves.linear,
                                      ),
                                      TyperAnimatedText(
                                        'a Website Developer',
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600
                                        ),
                                        speed: Duration(milliseconds: 50),
                                        curve: Curves.linear,
                                      ),
                                    ]
                                  ),
                                  
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'a dedicated programmer driven by the art of coding and a commitment to crafting efficient solutions. With expertise in various frameworks and a keen eye for detail, I specialize in developing user-friendly applications that seamlessly integrate cutting-edge technologies. ',
                            maxLines: 14,
                            style: TextStyle(
                              height: 2,
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: ()async{
                              Uri url = Uri.parse('https://drive.google.com/uc?export=download&id=1oQJZLGzeNLquq9QCp_X4ARqKaXip6YFS');
                              if( await canLaunchUrl(url)){
                                await launchUrl(url);
                              }
                              else{
                                throw ("Couldnt launch $url");
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.purple
                              ),
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Download CV',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              
                            ),
                            child: Lottie.asset(
                                'animations/animation_coding.json',
                                fit:BoxFit.cover
                              ),
                          )
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get in touch',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      height: 30,
                      width: 2,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 10,),
                    SocialButtons(
                      icon: FontAwesomeIcons.facebookF, 
                      tooltip: 'facebook.com',
                      url: 'https://www.facebook.com/tsm.mychaalll',
                    ),
                    SocialButtons(
                      icon: FontAwesomeIcons.solidEnvelope, 
                      tooltip: 'gmail.com',
                      url: 'mailto:tsmmychaalll@gmail.com?subject=Job%20Related',
                    ),
                    SocialButtons(
                      icon: FontAwesomeIcons.linkedin, 
                      tooltip: 'linkedin.com/m',
                      url: 'https://www.linkedin.com/in/mychal-esure%C3%B1a-534903286',
                    ),
                    SocialButtons(
                      icon: FontAwesomeIcons.github, 
                      tooltip: 'github.com/mychaalll',
                      url: 'https://github.com/mychaalll'
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(
            flex: 1
          ),
        ],
      ),
    );
  }
}
class SocialButtons extends StatefulWidget {
  final String tooltip;
  final IconData icon;
  final String url;
  
  const SocialButtons({
    Key? key,
    required this.tooltip,
    required this.icon,
    required this.url,
  }) : super(key: key);

  @override
  _SocialButtonsState createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Center(
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: InkWell(
            onTap: ()async{
              Uri url = Uri.parse(widget.url);
              if( await canLaunchUrl(url)){
                await launchUrl(url);
              }
              else{
                throw ("Couldnt launch $url");
              }
            },
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
              ),
              child: FaIcon(
                size: _isHovered? 45 : 30,
                widget.icon,
                color: AppColors.purple,
              )
            ),
          ),
        ),
      ),
    );
  }
}