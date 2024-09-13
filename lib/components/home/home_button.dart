import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeButton extends ConsumerWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: TextButton(
        key: const ValueKey('hero-button'),
        style: TextButton.styleFrom(
          fixedSize: const Size(375, 60),
          backgroundColor: Colors.deepPurple,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: () {
          Navigator.popAndPushNamed(context, '/login');
        },
        child: const Text(
          "Browse Categories",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
