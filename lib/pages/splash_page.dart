import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const routeName = '/splash';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Icon(
              Icons.trolley,
              size: 72,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'SHOP-SHOP',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Your one stop destination for everything..',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
