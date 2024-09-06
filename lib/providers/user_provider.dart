import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_commerce/models/firebase_user.dart';

final userProvider = StateNotifierProvider<UserNotifier, LocalUser>((ref) {
  return UserNotifier();
});

class LocalUser {
  final String id;
  final FirebaseUser user;

  LocalUser({
    required this.id,
    required this.user,
  });

  LocalUser copyWith({
    String? id,
    FirebaseUser? user,
  }) {
    return LocalUser(
      id: id ?? this.id,
      user: user ?? this.user,
    );
  }

  factory LocalUser.zero() {
    return LocalUser(
      id: 'defaultId',
      user: FirebaseUser.zero(),
    );
  }
}

class UserNotifier extends StateNotifier<LocalUser> {
  UserNotifier() : super(LocalUser.zero());

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  Future<void> logIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);

    final QuerySnapshot query =
        await _store.collection("users").where("email", isEqualTo: email).get();

    final DocumentSnapshot docSnapshot = query.docs[0];

    state = LocalUser(
      id: docSnapshot.id,
      user: FirebaseUser.fromMap(docSnapshot.data() as Map<String, dynamic>),
    );
  }

  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final FirebaseUser dbUser = FirebaseUser(email: email);

    final docReference = await _store.collection("users").add(dbUser.toMap());

    final docSnapshot = await docReference.get();
    state = LocalUser(id: docSnapshot.id, user: dbUser);
  }

  Future<void> signOut() async {}
}
