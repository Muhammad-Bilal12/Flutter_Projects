import 'package:flutter/material.dart';
import 'package:wallpaper_hub/controller/api_controller.dart';

import '../models/categories_model.dart';
import '../widgets/brand_name.dart';
import 'package:wallpaper_hub/data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoriesModel> category = [];

  @override
  void initState() {
    getTrendingWallpapers();
    category = categories;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const BrandName(),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: const Color(0xfff5f8fd),
            ),
            child: const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(Icons.search),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 80,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: category.length,
              itemBuilder: (context, index) {
                return CategoryTile(category: category[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.category});

  final CategoriesModel category;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            category.imageUrl,
            width: 100,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 100,
          height: 50,
          margin: const EdgeInsets.only(right: 16),
          alignment: Alignment.center,
          child: Text(
            category.cotegoryName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
