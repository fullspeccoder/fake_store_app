import 'package:e_commerce/models/item.dart';
import 'package:e_commerce/providers/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryPage extends ConsumerWidget {
  final String title;

  const CategoryPage({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryItems = ref
        .watch(itemsProvider)
        .items
        .where((el) => el.category == title.toLowerCase());
    print(categoryItems);
    return Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            const Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 15),
                Icon(Icons.shopping_cart),
              ],
            )
          ],
        )),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Container(
                width: 400,
                height: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
                child: Text(title,
                    style: TextStyle(fontSize: 32, letterSpacing: 0.05)),
              ),
              ...categoryItems.map((el) => ItemCard(item: el))
            ],
          ),
        ));
  }
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                  item.imageUrl,
                  width: 50,
                  height: 50,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.title),
                  Text(item.category),
                ],
              )
            ],
          ),
          Text('${item.price}'),
        ],
      ),
    );
  }
}
