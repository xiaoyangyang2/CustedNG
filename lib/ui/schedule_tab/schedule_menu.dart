import 'package:custed2/core/route.dart';
import 'package:custed2/core/script.dart';
import 'package:custed2/data/providers/schedule_provider.dart';
import 'package:custed2/data/providers/snakebar_provider.dart';
import 'package:custed2/locator.dart';
import 'package:custed2/ui/schedule_tab/add_lesson_page.dart';
import 'package:flutter/cupertino.dart';

class ScheduleMenu extends StatelessWidget {
  ScheduleMenu();

  @override
  Widget build(BuildContext context) {
    final scheduleProvider = locator<ScheduleProvider>();

    return CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text('更新课表'),
          onPressed: () {
            Navigator.of(context).pop();
            final snakebar = locator<SnakebarProvider>();
            snakebar.catchAll(() async {
              await scheduleProvider.updateScheduleData();
            }, message: '教务系统超时 :(', duration: Duration(seconds: 7));
          },
        ),
        CupertinoActionSheetAction(
          child: Text('添加课程'),
          onPressed: () {
            Navigator.of(context).pop();
            AppRoute(
              title: '添加课程',
              page: AddLessonPage(),
            ).popup(context);
          },
        ),
        // CupertinoActionSheetAction(
        //   child: Text(
        //       (Settings.showInactiveLessons.cachedValue ? "隐藏" : "显示") +
        //           "非本周课程"),
        //   onPressed: () {
        //     material.Navigator.of(context).pop();
        //     Settings.showInactiveLessons
        //         .put(!Settings.showInactiveLessons.cachedValue);
        //   },
        // ),
        // Consumer<UserModel>(
        //   builder: (context, user, widget) {
        //     return CupertinoActionSheetAction(
        //       child: material.Text("一键清空改动"),
        //       onPressed: () async {
        //         user.schedule.allLessons().forEach((lesson) async {
        //           if (lesson.type == 32){
        //             await user.delete(lesson.lessonHash,false);
        //           }
        //         });
        //         Future.delayed(Duration(seconds:1),(){
        //           user.updateSchedule(force: true);
        //         });
        //         material.Navigator.of(context).pop();
        //       },
        //     );
        //   },
        // ),
        CupertinoActionSheetAction(
          child: Text('常见问题&Tips'),
          onPressed: () {
            Navigator.of(context).pop();
            runScript('schedule_wrong.cl', context);
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text('取消'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
