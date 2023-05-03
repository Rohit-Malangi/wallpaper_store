part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperEvent {}

class FindTrendWallpaper extends WallpaperEvent {}

class FindSearchWallpaper extends WallpaperEvent {
  final String seachtext;
  FindSearchWallpaper(this.seachtext);
}
