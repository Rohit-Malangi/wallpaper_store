import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/categerious_model.dart';
import '../widgets/appbar_name.dart';
import '../widgets/categerie_tile.dart';
import '../widgets/wallpaper_list.dart';
import '../widgets/search_wallpaper_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategeriousModel> categerious = [];
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();
    categerious = getCategerious;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: appbarName(),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: search,
                    decoration: const InputDecoration(
                      hintText: 'search wallpaper',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) =>
                          SearchWallPaperList(query: search.text),
                    ),
                  ),
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 60,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categerious.length,
              itemBuilder: (context, index) {
                return CategerieTile(
                  imageUrl: categerious[index].imageUrl,
                  title: categerious[index].categeriousName,
                );
              },
            ),
          ),
          const WallpaperList(),
        ],
      ),
    );
  }
}
