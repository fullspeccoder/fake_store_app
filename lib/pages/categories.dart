import 'package:e_commerce/components/categories/category_card.dart';
import 'package:e_commerce/providers/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  const CategoriesPage({super.key});

  @override
  ConsumerState<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(itemsProvider.notifier);
    notifier.initializeItems();
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = ref.watch(itemsProvider.notifier).retriveCategories();
    return Scaffold(
        appBar: AppBar(title: const Text("Categories")),
        body: MasonryGridView.custom(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          childrenDelegate: SliverChildBuilderDelegate(
              (_, index) => CategoryCard(category: categoryList[index]),
              childCount: categoryList.length),
        ));
  }
}
