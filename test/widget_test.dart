// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:e_commerce/components/home/hero.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('splash screen details', () {
    testWidgets('splash screen title', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HeroContent(),
          ),
        ),
      );
      final textFinder = find.text('Lorem ipsum');

      expect(textFinder, findsOneWidget);
    });
    testWidgets('splash screen description', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: HeroContent(),
          ),
        ),
      );
      final textFinder = find.text("lorem ipsum halo solina fahli");

      expect(textFinder, findsOneWidget);
    });

    testWidgets('splash screen', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

      expect(find.byKey(const ValueKey('splash-screen')), findsOne);
    });

    testWidgets('splash screen button', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: MyHomePage()));

      expect(find.byKey(const ValueKey('hero-button')), findsOne);
    });
  });

  group('login page', () {
    testWidgets('app bar', (tester) async {
      await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform);
      await tester.pumpWidget(const LoginPage());

      expect(find.byType(AppBar), findsOne);
    });
  });
}
