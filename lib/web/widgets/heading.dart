import 'package:flutter/material.dart';
import 'package:portfolio_v2/utils/colors.dart';

class Heading extends StatelessWidget {
  final String text;
  const Heading({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 5,
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(8)
          ),
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700
          ),
        )
      ],
    );
  }
}