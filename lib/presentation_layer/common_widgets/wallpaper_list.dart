import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc_layer/bloc/wallpaper_bloc.dart';

import '../../data_layer/models/categerious_model.dart';
import '../screens/wallpaper_screen/wallpaper_screen.dart';

class WallpaperList extends StatelessWidget {
  const WallpaperList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WallpaperBloc, WallpaperState>(
      builder: (context, state) {
        if (state is FindWallpaperLoadingState ||
            state is SearchWallpaperLoadingState) {
          return const Expanded(
            child: Center(
              child: Text('Loading...'),
            ),
          );
        }
        if (state is FindWallpaperSuccessState) {
          List<WallPaperModel> list = state.list;
          return buildBody(list, context);
        }
        if (state is FindWallpaperSuccessState) {
          List<WallPaperModel> list = state.list;
          return buildBody(list, context);
        }
        if (state is WallpaperErrorState) {
          final String error = state.error;
          return Expanded(
            child: Center(
              child: Text(error),
            ),
          );
        }
        return const Center(
          child: Text('Error Occured'),
        );
      },
    );
  }

  Widget buildBody(List<WallPaperModel> list, BuildContext context) {
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
      ),
    );
  }
}
