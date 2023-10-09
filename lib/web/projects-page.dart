import 'package:flutter/material.dart';
import 'package:portfolio_v2/data/projects-data.dart';
import 'package:portfolio_v2/web/widgets/heading.dart';
import 'package:url_launcher/url_launcher.dart';

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

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    Key? key,
    required this.project,
    required this.onHover,
  }) : super(key: key);

  final Projects project;
  final Function(bool isHovered, String thumbnail) onHover;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        widget.onHover(true, widget.project.thumbnail);
        _pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        widget.onHover(false, widget.project.thumbnail);
        _pageController.previousPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
      },
      child: GestureDetector(
        onTap: ()async{
          Uri url = Uri.parse(widget.project.link);
          if( await canLaunchUrl(url)){
            await launchUrl(url);
          }
          else{
            throw ("Couldnt launch $url");
          }
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12)
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image(
                  image: AssetImage(widget.project.thumbnail),
                  fit: BoxFit.cover
                ),
              ),
              PageView(
              controller: _pageController,
              children: [
                Stack(
                  children: [
                    Positioned.fill(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: 15,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text(
                          widget.project.date,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          ),
                        ),

                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            widget.project.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          const SizedBox(height: 10,),
                          SizedBox(
                            height: 30, // Set a fixed height for the ListView if needed
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.project.tools.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 4.0),
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(widget.project.toolsIcon[index]),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  color: Colors.black.withOpacity(0.9),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          widget.project.title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                            ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        flex: 5,
                        child: SingleChildScrollView(
                          child: Text(
                            widget.project.details,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              height: 1.5,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Used: ${widget.project.tools.join(", ")}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            height: 1.5,
                            fontWeight: FontWeight.w400
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ]
                  )
                )
              ],
            ),
            ],
          )
        ),
      ),
    );
  }
}