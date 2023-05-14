part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperState {
  const WallpaperState();
}

class FindWallpaperLoadingState extends WallpaperState {
  const FindWallpaperLoadingState();
}

class FindWallpaperSuccessState extends WallpaperState{
  final List<WallPaperModel> list;
  const FindWallpaperSuccessState(this.list);
}

class WallpaperErrorState extends WallpaperState{
  final String error;
  const WallpaperErrorState(this.error);
}

class SearchWallpaperLoadingState extends WallpaperState {
  const SearchWallpaperLoadingState();
}

class SearchWallpaperSuccessState extends WallpaperState {
  final List<WallPaperModel> list;
  const SearchWallpaperSuccessState(this.list);
}