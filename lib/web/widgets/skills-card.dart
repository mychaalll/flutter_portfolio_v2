import 'package:flutter/material.dart';
import 'package:portfolio_v2/data/skills-data.dart';
import 'package:portfolio_v2/utils/colors.dart';


class SkillsCard extends StatelessWidget {
  int index;
  
  SkillsCard({
    super.key,
    required this.index,
    required this.skillsToDisplay,
  });

  final List<Skills> skillsToDisplay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal:10.0),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Image.asset(
                skillsToDisplay[index].imgPath,
                fit: BoxFit.fill,
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              skillsToDisplay[index].title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600
              ), 
            )
          ],
        ),
      ),  
    );
  }
}