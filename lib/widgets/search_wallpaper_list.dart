import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/wallpapers.dart';
import '../models/categerious_model.dart';
import '../screens/wallpaper_screen.dart';
import '../widgets/appbar_name.dart';

class SearchWallPaperList extends StatelessWidget {
  const SearchWallPaperList({Key? key, required this.query}) : super(key: key);

  final String query;
  @override
  Widget build(BuildContext context) {
    List<WallPaperModel>? list = [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: appbarName(),
        elevation: 0.0,
      ),
      body: FutureBuilder(
          future: Provider.of<WallPaper>(context, listen: false)
              .getSearchWallpaper(query),
          builder: (ctx, dataSnapShot) {
            list = dataSnapShot.data as List<WallPaperModel>?;
            return dataSnapShot.connectionState == ConnectionState.done
                ? GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 6.0,
                      crossAxisSpacing: 6.0,
                    ),
                    itemCount: list!.length,
                    itemBuilder: ((ctx, index) {
                      return GridTile(
                        child: InkResponse(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => WallPaperScreen(
                                  imageUrl: list![index].imageUrl),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              list![index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
                  )
                : const Center(
                    child: Text('Loading...'),
                  );
          }),
    );
  }
}
