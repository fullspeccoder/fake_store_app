import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/': (_) => const MyHomePage(),
          '/login': (_) => const LoginPage(),
        });
  }
}
