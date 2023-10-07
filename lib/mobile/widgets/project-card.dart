import 'package:flutter/material.dart';
import 'package:portfolio_v2/data/projects-data.dart';

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
        _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        widget.onHover(false, widget.project.thumbnail);
        _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
      },
      child: GestureDetector(
        onTap: (){
          if(!_isHovered){
            setState(() => _isHovered = true);
            widget.onHover(true, widget.project.thumbnail);
            _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
          }
          else{
            setState(() => _isHovered = false);
            widget.onHover(false, widget.project.thumbnail);
            _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
          }
        },
        onLongPress: (){
          setState(() => _isHovered = true);
          widget.onHover(true, widget.project.thumbnail);
          _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
        },
        onLongPressUp: (){
          setState(() => _isHovered = false);
          widget.onHover(false, widget.project.thumbnail);
          _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
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