import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/wallpaper_screen.dart';
import '../data/wallpapers.dart';
import '../models/categerious_model.dart';

class WallpaperList extends StatelessWidget {
  const WallpaperList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<WallPaperModel>? list;
    return FutureBuilder(
        future:
            Provider.of<WallPaper>(context, listen: false).getTrendWallpeper,
        builder: (ctx, dataSnapShot) {
          list = dataSnapShot.data as List<WallPaperModel>?;
          return dataSnapShot.connectionState == ConnectionState.done
              ? Expanded(
                  child: GridView.builder(
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
                  ),
                )
              : const Expanded(
                  child: Center(
                    child: Text('Loading...'),
                  ),
                );
        });
  }
}
