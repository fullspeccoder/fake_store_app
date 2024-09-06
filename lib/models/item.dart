// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Item {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String imageUrl;
  final Map<dynamic, dynamic> rating;

  Item({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.rating,
  });

  Item copyWith({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? imageUrl,
    Map<dynamic, dynamic>? rating,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'imageUrl': imageUrl,
      'rating': rating,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as num,
      description: map['description'] as String,
      category: map['category'] as String,
      imageUrl: map['image'] as String,
      rating: Map<dynamic, dynamic>.from(
        (map['rating'] as Map<dynamic, dynamic>),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, title: $title, price: $price, description: $description, category: $category, imageUrl: $imageUrl, rating: $rating)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.price == price &&
        other.description == description &&
        other.category == category &&
        other.imageUrl == imageUrl &&
        mapEquals(other.rating, rating);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        price.hashCode ^
        description.hashCode ^
        category.hashCode ^
        imageUrl.hashCode ^
        rating.hashCode;
  }
}
