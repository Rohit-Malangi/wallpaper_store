import 'package:flutter/material.dart';

import '../../../common_widgets/search_wallpaper_list.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController search;

  @override
  void initState() {
    search = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
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
              builder: (context) => SearchWallPaperList(query: search.text),
            ),
          ),
          icon: const Icon(Icons.search),
        ),
      ],
    ),
  );
  }
}

