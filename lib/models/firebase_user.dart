import 'dart:convert';

class FirebaseUser {
  final String email;

  FirebaseUser({required this.email});

  FirebaseUser copyWith({
    String? email,
  }) {
    return FirebaseUser(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  factory FirebaseUser.fromMap(Map<String, dynamic> map) {
    return FirebaseUser(
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseUser.fromJson(String source) =>
      FirebaseUser.fromMap(json.decode(source));

  factory FirebaseUser.zero() {
    return FirebaseUser(email: 'null');
  }
}
