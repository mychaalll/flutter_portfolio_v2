import 'package:flutter/material.dart';
import 'package:portfolio_v2/data/skills-data.dart';
import 'package:portfolio_v2/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:portfolio_v2/web/widgets/heading.dart';
import 'package:portfolio_v2/web/widgets/skills-card.dart';

class SkillsPage extends StatefulWidget {
  SkillsPage({
    super.key,
    required this.height,
  });

  final double height;

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  PageController pageController = new PageController();

  final List<Skills> skills1 = developmentSkills; 

  final List<Skills> skills2 = programmingSkills; 

  final List<Skills> skills3 = dbbeSkills; 

  final List<Skills> skills4 = toolSkills; 

  late List<Skills> skillsToDisplay = skills1;

  final List skillTitles = ['Development Skills', 'Programming Languages', 'Database and Back-end', 'Development Tools'];
  int currentPage = 0;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Row(
        children: [
          Spacer(flex: 1),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                const SizedBox(height: 80),
                Heading(text: 'SKILLS'),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      skillTitles[currentPage],
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),        
                    ),
                    Spacer(flex: 1),
                    currentPage != 0 ? Column(
                      children: [
                        IconButton(
                          onPressed: (){
                            pageController.previousPage(
                              duration: Duration(milliseconds: 500), 
                              curve: Curves.decelerate
                            );
                          }, 
                          icon: Icon(
                            Icons.arrow_left_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        SizedBox(height: 5)
                      ],
                    ): Container(),
                    currentPage != 3 ? Column(
                      children: [
                        IconButton(
                          onPressed: (){
                            pageController.nextPage(
                              duration: Duration(milliseconds: 500), 
                              curve: Curves.decelerate
                            );
                          }, 
                          icon: Icon(
                            Icons.arrow_right_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        SizedBox(height: 5)
                      ],
                    ): Container()
                  ],
                ),
                SizedBox(height:10),
                Expanded(
                  child: Container(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: 4,
                      onPageChanged:(value) {
                        setState(() {
                          currentPage = value;
                        });
                        
                        if (currentPage == 0){
                          skillsToDisplay = skills1;
                          print(skillsToDisplay.length);
                        }
                        else if (currentPage == 1){
                          skillsToDisplay = skills2;
                          print(skillsToDisplay.length);
                        }
                        else if(currentPage == 2){
                          skillsToDisplay = skills3;
                          print(skillsToDisplay.length);
                        }
                        else if(currentPage == 3){
                          skillsToDisplay = skills4;
                          print(skillsToDisplay.length);
                        }
                      },
                      itemBuilder: (context, index){
                        return Container(
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 150,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                            ),
                            itemCount: skillsToDisplay.length,
                            itemBuilder: ((context, index) {
                              return SkillsCard(
                                skillsToDisplay: skillsToDisplay,
                                index: index,
                              );
                          }))
                        );
                      },
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: skillTitles.length,
                  axisDirection: Axis.horizontal,
                  effect: SwapEffect(
                    dotHeight: 5,
                    dotWidth: 30,
                    spacing: 10,
                    activeDotColor: AppColors.purple,
                    type: SwapType.yRotation
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}