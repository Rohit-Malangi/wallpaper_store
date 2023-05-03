import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc_layer/bloc/wallpaper_bloc.dart';
import './presentation_layer/screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WallpaperBloc()..add(FindTrendWallpaper()),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          )),
        ),
        debugShowCheckedModeBanner: false,
        title: 'WallPaper_Store',
        home: const HomeScreen(),
      ),
    );
  }
}
