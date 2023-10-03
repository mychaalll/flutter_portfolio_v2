import 'package:flutter/material.dart';
import 'package:portfolio_v2/utils/colors.dart';


class NavButtons extends StatefulWidget {
  final isActive;
  final String text;
  final Function()? onTap;
  NavButtons({
    super.key, required this.text, required this.onTap, this.isActive, 
  });

  @override
  State<NavButtons> createState() => _NavButtonsState();
}

class _NavButtonsState extends State<NavButtons> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 10,
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap, 
          child: Container(
            child: Column(
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        color: _isHovered ? AppColors.purple : Colors.white,
                        offset: Offset(0, -5)
                      )
                    ],
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color:Colors.transparent,
                    decoration:  _isHovered ? TextDecoration.underline :TextDecoration.none,
                    decorationThickness: 2,
                    decorationColor: Colors.white
                  ),
                ),
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}