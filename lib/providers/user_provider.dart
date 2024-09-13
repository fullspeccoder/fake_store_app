// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user': user.toMap(),
    };
  }

  factory LocalUser.fromMap(Map<String, dynamic> map) {
    return LocalUser(
      id: map['id'] as String,
      user: FirebaseUser.fromMap(map['user'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalUser.fromJson(String source) =>
      LocalUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LocalUser(id: $id, user: $user)';

  @override
  bool operator ==(covariant LocalUser other) {
    if (identical(this, other)) return true;

    return other.id == id && other.user == user;
  }

  @override
  int get hashCode => id.hashCode ^ user.hashCode;
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
