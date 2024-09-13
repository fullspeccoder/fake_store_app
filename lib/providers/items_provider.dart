import 'dart:convert';

import 'package:e_commerce/models/item.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemsProvider = StateNotifierProvider<ItemsNotifier, ItemList>((ref) {
  return ItemsNotifier();
});

class ItemList {
  final List<dynamic> items;

  ItemList({
    required this.items,
  });
}

class ItemsNotifier extends StateNotifier<ItemList> {
  ItemsNotifier() : super(ItemList(items: []));

  final String baseUrl = "fakestoreapi.com";

  Future<void> initializeItems() async {
    final Uri itemsUrl = Uri.http(baseUrl, '/products');

    final response = await http.get(itemsUrl);

    if (response.statusCode != 200) {
      return;
    }
    final listItems = jsonDecode(response.body)
        .map((el) => Item.fromMap(el as Map<String, dynamic>))
        .toList();

    state = ItemList(items: listItems);
  }

  List<dynamic> retriveCategories() {
    final categoryList = state.items.map((el) => el.category).toList();
    final sortedCategoryList = categoryList.toSet().toList();
    return sortedCategoryList;
  }

  List<dynamic> retrieveCategoryCatalog(String category) {
    return state.items.where((el) {
      return el.category == category;
    }).toList();
  }
}
