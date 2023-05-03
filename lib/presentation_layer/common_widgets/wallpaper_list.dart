import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc_layer/bloc/wallpaper_bloc.dart';

import '../screens/wallpaper_screen/wallpaper_screen.dart';

class WallpaperList extends StatelessWidget {
  const WallpaperList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WallpaperBloc, WallpaperState>(
      builder: (context, state) {
        if (state is FindWallpaperLoadingState) {
          return const Expanded(
            child: Center(
              child: Text('Loading...'),
            ),
          );
        } else if (state is FindWallpaperSuccessState || state is SearchWallpaperSuccessState) {
          return Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 6.0,
                crossAxisSpacing: 6.0,
              ),
              itemCount: state.treandList.length,
              itemBuilder: ((ctx, index) {
                return GridTile(
                  child: InkResponse(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) =>
                            WallPaperScreen(imageUrl: state.treandList[index].imageUrl),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        state.treandList[index].imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        } else {
          return const Expanded(
            child: Center(
              child: Text('Unknown Error Occured...'),
            ),
          );
        }
      },
    );
  }
}
