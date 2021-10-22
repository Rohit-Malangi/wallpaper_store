import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './data/wallpapers.dart';
import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => WallPaper(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'WallPaper_Store',
        home: HomeScreen(),
      ),
    );
  }
}
