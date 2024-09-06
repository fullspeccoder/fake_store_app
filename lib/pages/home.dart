import 'package:e_commerce/components/home/hero.dart';
import 'package:e_commerce/components/home/home_button.dart';
import 'package:e_commerce/providers/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(itemsProvider.notifier);
    notifier.initializeItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/kayak.jpg"),
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            fit: BoxFit.cover,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(),
                HeroContent(),
                HomeButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
