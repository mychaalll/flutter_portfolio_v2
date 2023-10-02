import 'package:flutter/material.dart';

class MainPageTablet extends StatelessWidget {
  const MainPageTablet({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
        child: Column(
          children: [
            Text('This is Tablet'),
            Container(
              height: 50,
              width: 200,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 200,
              color: Theme.of(context).colorScheme.secondary,
            )

          ],
        ),
      ),
    );
  }
}