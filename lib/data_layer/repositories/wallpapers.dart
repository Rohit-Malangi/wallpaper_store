
import '../providers/get_search_wallpaper.dart';
import '../providers/get_wallpapers.dart';
import '../models/categerious_model.dart';

class WallPaper{
  Future<List<WallPaperModel>> get getTreandWallpeper => WallpaperProvider().getTrendWallpeper;

  Future<List<WallPaperModel>> getSearchWallpaper(String query) => SearchWallpaper().getSearchWallpaper(query);
}
