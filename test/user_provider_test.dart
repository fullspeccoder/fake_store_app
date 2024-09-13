import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/models/firebase_user.dart';
import 'package:e_commerce/providers/items_provider.dart';
import 'package:e_commerce/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  late ProviderContainer container;
  late UserNotifier userNotifier;
  late ItemsNotifier itemsNotifier;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUp(() {
    container = ProviderContainer();
    userNotifier = container.read(userProvider.notifier);
    itemsNotifier = container.read(itemsProvider.notifier);
  });

  // group('Default states', () {
  //   test("Starts in default state", () {
  //     expect(userNotifier.debugState, LocalUser.zero());
  //   });
  // });
  // group("Sign In Functionality", () {
  //   test("Should not sign in with empty string for name and password",
  //       () async {
  //     userNotifier.logIn("", "");
  //     expect(container.read(userProvider).id, equals("defaultId"));
  //   });
  // });
}
