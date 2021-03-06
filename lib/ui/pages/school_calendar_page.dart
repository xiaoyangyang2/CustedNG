import 'package:flutter/cupertino.dart';
import 'package:custed2/res/image_res.dart';
import 'package:photo_view/photo_view.dart';

class SchoolCalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: '主页',
        backgroundColor: CupertinoColors.black,
        actionsForegroundColor: CupertinoColors.white,
        middle: Text('校历', style: TextStyle(color: CupertinoColors.white)),
      ),
      child: ClipRect(
          child: SafeArea(
        child: PhotoView(
          maxScale: 1.0,
          minScale: 0.1,
          imageProvider: ImageRes.miscSchoolCalendar,
        ),
      )),
    );
  }
}
