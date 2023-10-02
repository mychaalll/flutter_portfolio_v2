import 'package:flutter/material.dart';

class MainPageMobile extends StatelessWidget {
  const MainPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('This is mobile')
          ],
        ),
      ),
    );
  }
}