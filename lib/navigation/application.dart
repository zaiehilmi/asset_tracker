import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui/features/dashboard/dashboard_view.dart';
import 'package:ui/features/search/search_view.dart';

const tabIconSize = 28.0;

// TODO(navigation): tambah favorite.
final tabBarItems = [
  const BottomNavigationBarItem(
    icon: Icon(Amicons.vuesax_chart_square, size: tabIconSize),
    activeIcon: Icon(Amicons.vuesax_chart_square_fill, size: tabIconSize),
    label: 'Ringkasan',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Amicons.vuesax_user, size: tabIconSize),
    activeIcon: Icon(Amicons.vuesax_user_fill, size: tabIconSize),
    label: 'Profil',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Amicons.iconly_search, size: tabIconSize),
    activeIcon: Icon(Amicons.iconly_search_fill, size: tabIconSize),
    label: 'Cari',
  ),
];

final tabViews = <Widget>[
  DashboardView(),
  const CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(middle: Text('Profil')),
    child: Center(child: Text('Kandungan Profil')),
  ),
  SearchView(),
];

class Application extends HookWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: tabBarItems),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(builder: (context) => tabViews[index]);
      },
    );
  }
}
