import 'package:flutter/material.dart';
import 'package:portfolio_v2/data/projects-data.dart';
import 'package:portfolio_v2/mobile/widgets/heading.dart';
import 'package:portfolio_v2/mobile/widgets/project-card.dart';

class ProjectsPage extends StatefulWidget {
  final double height;
  const ProjectsPage({super.key, required this.height});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {

  String hoveredThumbnail = "assets/images/polygon-bg1.jpg"; // New variable to store the hovered thumbnail
  bool isProjectHovered = false;

  // Callback function to update hoveredThumbnail
  void updateHoveredThumbnail(bool isHovered, String thumbnail) {
    if (isHovered) {
      setState(() {
        hoveredThumbnail = thumbnail;
        isProjectHovered = true;
      });
    } else {
      setState(() {
        isProjectHovered = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: isProjectHovered ? 0.5: 0,
                child: Image(
                  image: AssetImage(hoveredThumbnail),
                  repeat: ImageRepeat.repeatY,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                Spacer(flex: 1,),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      const SizedBox(height: 80,),
                      Heading(text: 'PROJECTS'),
                      const SizedBox(height: 20,),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                          childAspectRatio: 0.7,
                          maxCrossAxisExtent: 300,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: projectList.length,
                        itemBuilder: ((context, index) {
                          Projects project = projectList[index];
                          return ProjectCard(
                            project: project,
                            onHover: updateHoveredThumbnail,
                          );
                      })),
                      const SizedBox(height: 80,),
                    ],
                  ),
                ),
                Spacer(flex: 1,),
                
              ],
            ),
          ),
          
        ]
      ),
    );
  }
}

