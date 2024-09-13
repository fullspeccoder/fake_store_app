import 'package:e_commerce/components/categories/category_card.dart';
import 'package:e_commerce/pages/category_page.dart';
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
    ref.read(itemsProvider.notifier).initializeItems();
  }

  @override
  Widget build(BuildContext context) {
    final categoryList = ref
        .watch(itemsProvider)
        .items
        .map((el) => el.category)
        .toSet()
        .toList();
    return Scaffold(
        appBar: AppBar(title: const Text("Categories")),
        body: MasonryGridView.custom(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          childrenDelegate: SliverChildBuilderDelegate(
              (_, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) =>
                                CategoryPage(title: categoryList[index])));
                  },
                  child: CategoryCard(category: categoryList[index])),
              childCount: categoryList.length),
        ));
  }
}
