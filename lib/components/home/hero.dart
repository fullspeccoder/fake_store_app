import 'package:flutter/material.dart';

class HeroContent extends StatelessWidget {
  const HeroContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lorem ipsum",
          style: TextStyle(color: Colors.white, fontSize: 48),
        ),
        Text(
          "lorem ipsum halo solina fahli",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ],
    );
  }
}
