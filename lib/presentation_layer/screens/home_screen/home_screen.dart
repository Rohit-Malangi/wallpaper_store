import 'package:flutter/material.dart';

import '../../common_widgets/appbar_name.dart';
import '../../common_widgets/wallpaper_list.dart';

import './widgets/horizontal_listview.dart';
import './widgets/searchbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          const SearchBar(),
          const SizedBox(height: 10),
          horizontalListView(),
          const WallpaperList(),
        ],
      ),
    );
  }
}
