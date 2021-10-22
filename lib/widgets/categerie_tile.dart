import 'package:flutter/material.dart';
import '../widgets/search_wallpaper_list.dart';

class CategerieTile extends StatelessWidget {
  const CategerieTile({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  final String imageUrl, title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => SearchWallPaperList(
            query: title,
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 50,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 50,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
