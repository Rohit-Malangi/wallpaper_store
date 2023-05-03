import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data_layer/models/categerious_model.dart';
import '../../data_layer/repositories/wallpapers.dart';

part 'wallpaper_event.dart';
part 'wallpaper_state.dart';

class WallpaperBloc extends Bloc<WallpaperEvent, WallpaperState> {
  WallpaperBloc() : super(const FindWallpaperLoadingState(list: [], search: [])) {
    on<FindTrendWallpaper>((event, emit) async {
      try {
        await WallPaper().getTreandWallpeper.then((value) => emit(
            FindWallpaperSuccessState(list: value, search: state.searchdList)));
      } catch (e) {
        emit(const FindWallpaperErrorState(list: [], search: []));
      }
    });

    on<FindSearchWallpaper>((event, emit) async {
      emit(SearchWallpaperLoadingState(treandList: state.treandList, searchdList: state.searchdList));
      try {
       await WallPaper().getSearchWallpaper(event.seachtext).then((value) => emit(
            SearchWallpaperSuccessState(treandList: state.treandList, searchdList: value)));
      } catch (e) {
        emit(const SearchWallpaperErrorState(treandList: [], searchdList: []));
      }
    });
  }
}
