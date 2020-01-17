import 'package:custed2/config/route.dart';
import 'package:custed2/ui/home/widgets/weather.dart';
import 'package:custed2/ui/widgets/navbar/more_btn.dart';
import 'package:custed2/ui/widgets/navbar/navbar.dart';
import 'package:custed2/ui/widgets/navbar/title.dart';
import 'package:custed2/ui/widgets/placeholder/placeholder.dart';
import 'package:flutter/cupertino.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: NavBar.cupertino(
        context: context,
        leading: NavBarTitle(
          child: GestureDetector(
            child: Text('Custed'),
            onTap: () => print('1'),
            onLongPress: () => debugPage.go(context),
          ),
        ),
        middle: WeatherWidget(),
        trailing: NavBarMoreBtn(
          onTap: () {},
        ),
      ),
      child: PlaceholderWidget(),
    );
  }
}