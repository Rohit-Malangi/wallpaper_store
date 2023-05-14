import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc_layer/bloc/wallpaper_bloc.dart';

import '../screens/wallpaper_screen/wallpaper_screen.dart';

import './appbar_name.dart';

class SearchWallPaperList extends StatelessWidget {
  const SearchWallPaperList({Key? key, required this.query}) : super(key: key);

  final String query;
  @override
  Widget build(BuildContext context) {
    context.read<WallpaperBloc>().add(FindSearchWallpaper(query));

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: appbarName(),
        elevation: 0.0,
      ),
      body: BlocBuilder<WallpaperBloc, WallpaperState>(
        builder: (context, state) {
          if (state is SearchWallpaperSuccessState) {
            final list = state.list;
            if (list.isEmpty) {
              return const Center(
                child: Text('Wallpaper not found for this search.'),
              );
            } else {
              return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 6.0,
                  crossAxisSpacing: 6.0,
                ),
                itemCount: list.length,
                itemBuilder: ((ctx, index) {
                  return GridTile(
                    child: InkResponse(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) =>
                              WallPaperScreen(imageUrl: list[index].imageUrl),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          list[index].imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
              );
            }
          }
          if (state is FindWallpaperLoadingState ||
              state is SearchWallpaperLoadingState) {
            return const Center(
              child: Text('Loading...'),
            );
          }
          if (state is WallpaperErrorState) {
            final error = state.error;
            return Center(
              child: Text(error),
            );
          }
          return const Center(
            child: Text('Error Occured'),
          );
        },
      ),
    );
  }
}
