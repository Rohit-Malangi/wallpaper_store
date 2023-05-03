part of 'wallpaper_bloc.dart';

@immutable
abstract class WallpaperState {
  final List<WallPaperModel> treandList;
  final List<WallPaperModel> searchdList;

  const WallpaperState({required this.treandList, required this.searchdList});
}

class FindWallpaperLoadingState extends WallpaperState {
  const FindWallpaperLoadingState({required List<WallPaperModel> list, required List<WallPaperModel> search}) : super(treandList: list, searchdList: search);
}

class FindWallpaperSuccessState extends WallpaperState{
  const FindWallpaperSuccessState({required List<WallPaperModel> list, required List<WallPaperModel> search}) : super(treandList: list, searchdList: search);
}

class FindWallpaperErrorState extends WallpaperState{
  const FindWallpaperErrorState({required List<WallPaperModel> list, required List<WallPaperModel> search}) : super(treandList: list, searchdList: search);
}

class SearchWallpaperLoadingState extends WallpaperState {
  const SearchWallpaperLoadingState({required List<WallPaperModel> treandList, required List<WallPaperModel> searchdList}) : super(treandList: treandList, searchdList: searchdList);
}

class SearchWallpaperSuccessState extends WallpaperState {
  const SearchWallpaperSuccessState({required List<WallPaperModel> treandList, required List<WallPaperModel> searchdList}) : super(treandList: treandList, searchdList: searchdList);
}

class SearchWallpaperErrorState extends WallpaperState {
  const SearchWallpaperErrorState({required List<WallPaperModel> treandList, required List<WallPaperModel> searchdList}) : super(treandList: treandList, searchdList: searchdList);
}