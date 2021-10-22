import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';

class WallPaperScreen extends StatelessWidget {
  const WallPaperScreen({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  void openButtomSheet(BuildContext ctx) {
    showModalBottomSheet<dynamic>(
      backgroundColor: Colors.transparent,
      elevation: 0.4,
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return Wrap(
          alignment: WrapAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              child: const Text('SET AS HOME SCREEN'),
              onPressed: () => setWallPaper(ctx, imageUrl, 1),
            ),
            const Divider(),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              child: const Text('SET AS LOCK SCREEN'),
              onPressed: () => setWallPaper(ctx, imageUrl, 2),
            ),
            const Divider(),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              child: const Text('SET AS HOME AND LOCK SCREEN'),
              onPressed: () => setWallPaper(ctx, imageUrl, 3),
            ),
            const Divider(),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
              ),
              child: const Text('CENCEL'),
              onPressed: () => Navigator.pop(ctx),
            ),
          ],
        );
      },
    );
  }

  Future<void> setWallPaper(BuildContext ctx, String imageUrl, int val) async {
    String msg = "";
    int location;
    if (val != 3) {
      if (val == 1) {
        msg = 'WallPaper Applied In Home Screen.';
        location = WallpaperManager.HOME_SCREEN;
      } else {
        msg = 'WallPaper Applied In Lock Screen.';
        location = WallpaperManager.LOCK_SCREEN;
      }
      Navigator.pop(ctx);
      try {
        var file = await DefaultCacheManager().getSingleFile(imageUrl);
        await WallpaperManager.setWallpaperFromFile(file.path, location);
      } on Exception {
        msg = 'An Error Occurs!';
      }
    } else {
      Navigator.pop(ctx);
      msg = 'WallPaper Applied In Home And Lock Screen.';
      int location1 = WallpaperManager.HOME_SCREEN;
      int location2 = WallpaperManager.LOCK_SCREEN;
      try {
        var file = await DefaultCacheManager().getSingleFile(imageUrl);
        await WallpaperManager.setWallpaperFromFile(file.path, location1);
        await WallpaperManager.setWallpaperFromFile(file.path, location2);
      } on Exception {
        msg = 'An Error Occurs!';
      }
    }
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black12,
                padding: const EdgeInsets.all(4),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onPressed: () => openButtomSheet(context),
              child: const Text(
                'APPLY WALLPAPER',
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
