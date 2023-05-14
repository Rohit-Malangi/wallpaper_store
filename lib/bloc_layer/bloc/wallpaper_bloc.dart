import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data_layer/models/categerious_model.dart';
import '../../data_layer/repositories/wallpapers.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  WallpaperBloc() : super(const FindWallpaperLoadingState()) {
    on<FindTrendWallpaper>((event, emit) async {
      try {
        await WallPaper().getTreandWallpeper.then((value) => emit(FindWallpaperSuccessState(value)));
      } catch (e) {
        emit(WallpaperErrorState(e.toString()));
      }
    });

    on<FindSearchWallpaper>((event, emit) async {
      emit(const SearchWallpaperLoadingState());
      try {
       await WallPaper().getSearchWallpaper(event.seachtext).then((value) => emit(
            SearchWallpaperSuccessState(value)));
      } catch (e) {
        emit(WallpaperErrorState(e.toString()));
      }
    });
  }
}
