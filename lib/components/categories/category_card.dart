import 'package:e_commerce/pages/category_page.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => CategoryPage(
                    title: category[0].toUpperCase() + category.substring(1))));
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Image.network(
          'https://images.freeimages.com/images/large-previews/56d/peacock-1169961.jpg?fmt=webp&w=500',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
