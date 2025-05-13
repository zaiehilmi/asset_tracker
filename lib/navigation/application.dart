import 'package:amicons/amicons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:june/state_manager/src/simple/state.dart';
import 'package:ui/features/dashboard/dashboard_screen.dart';
import 'package:ui/features/scanner/barcode_scanner_screen.dart';
import 'package:ui/features/search/main_search_screen.dart';
import 'package:ui/navigation/application_viewmodel.dart';

const tabIconSize = 28.0;

final tabBarItems = [
  const BottomNavigationBarItem(
    icon: Icon(Amicons.vuesax_chart_square, size: tabIconSize),
    activeIcon: Icon(Amicons.vuesax_chart_square_fill, size: tabIconSize),
    label: 'Ringkasan',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Amicons.lucide_scan_barcode, size: tabIconSize),
    activeIcon: Icon(Amicons.lucide_scan, size: tabIconSize),
    label: 'Imbas',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Amicons.iconly_search, size: tabIconSize),
    activeIcon: Icon(Amicons.iconly_search_fill, size: tabIconSize),
    label: 'Cari',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Amicons.vuesax_star_1, size: tabIconSize),
    activeIcon: Icon(Amicons.vuesax_star_fill, size: tabIconSize),
    label: 'kegemaran',
  ),
];

final tabViews = <Widget>[
  const DashboardScreen(),
  const BarcodeScannerScreen(),
  const MainSearchScreen(),
  const BarcodeScannerScreen(),
];

class Application extends HookWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useMemoized(CupertinoTabController.new);

    useEffect(() {
      void listener() {
        if (tabController.index == 1) {
          applicationState.brightness = Brightness.dark;
        } else {
          applicationState.brightness = Brightness.light;
        }
      }

      tabController.addListener(listener);
      return () => tabController.removeListener(listener);
    }, [tabController]);

    return JuneBuilder(
      ApplicationVM.new,
      builder:
          (vm) => CupertinoTabScaffold(
            controller: tabController,
            tabBar: CupertinoTabBar(
              items: tabBarItems,
              height: 60,
              backgroundColor: CupertinoColors.systemBackground,
            ),
            tabBuilder: (BuildContext context, int index) {
              return CupertinoTabView(builder: (context) => tabViews[index]);
            },
          ),
    );
  }
}
