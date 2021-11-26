import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:yht_ticket/routes/app_pages.dart';
import 'package:yht_ticket/shared/utils/size_config.dart';
import 'package:yht_ticket/theme/theme_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        //This router outlet handles the appbar and the bottom navigation bar
        final currentLocation = currentRoute?.location;
        var currentIndex = 0;
        if (currentLocation?.startsWith(Routes.PROFILE) == true) {
          currentIndex = 2;
        }
        if (currentLocation?.startsWith(Routes.HISTORY) == true) {
          currentIndex = 1;
        }

        return Scaffold(
          body: GetRouterOutlet(
            initialRoute: Routes.DASHBOARD,
            // anchorRoute: Routes.HOME,
            key: Get.nestedKey(Routes.HOME),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            shape: const CircularNotchedRectangle(),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.theme.bottomAppBarTheme.color,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.theme.cardTheme.shadowColor!.withAlpha(40),
                    blurRadius: 3,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              padding:
                  EdgeInsets.only(top: MySize.size12!, bottom: MySize.size12!),
              child: TabBar(
                onTap: (value) {
                  switch (value) {
                    case 0:
                      delegate.toNamed(Routes.HOME);
                      break;
                    case 1:
                      delegate.toNamed(Routes.HISTORY);
                      break;
                    case 2:
                      delegate.toNamed(Routes.PROFILE);
                      break;
                    default:
                  }
                },
                controller: _tabController,
                indicator: const BoxDecoration(),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppTheme.theme.colorScheme.primary,
                tabs: <Widget>[
                  _buildTabItem(
                      currentIndex, 0, MdiIcons.home, MdiIcons.homeOutline),
                  _buildTabItem(
                      currentIndex, 1, MdiIcons.history, MdiIcons.history),
                  _buildTabItem(currentIndex, 2, MdiIcons.account,
                      MdiIcons.accountOutline),
                ],
              ),
            ),
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: currentIndex,
          //   onTap: (value) {
          //     switch (value) {
          //       case 0:
          //         delegate.toNamed(Routes.HOME);
          //         break;
          //       case 1:
          //         delegate.toNamed(Routes.HISTORY);
          //         break;
          //       case 2:
          //         delegate.toNamed(Routes.PROFILE);
          //         break;
          //       default:
          //     }
          //   },
          // items: const [
          //   // _Paths.HOME + [Empty]
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.home),
          //     label: 'Home',
          //   ),
          //   // _Paths.HOME + Routes.PROFILE
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.account_box_rounded),
          //     label: 'Profile',
          //   ),
          //   // _Paths.HOME + _Paths.PRODUCTS
          //   BottomNavigationBarItem(
          //     icon: Icon(Icons.account_box_rounded),
          //     label: 'Products',
          //   ),
          // ],
        );
      },
    );
  }

  Widget _buildTabItem(
      int currentIndex, int desiredIndex, IconData icon, IconData passiveIcon) {
    return (currentIndex == desiredIndex)
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                color: AppTheme.theme.colorScheme.primary,
              ),
              Container(
                margin: EdgeInsets.only(top: MySize.size4!),
                decoration: BoxDecoration(
                    color: AppTheme.theme.primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(2.5))),
                height: 5,
                width: 5,
              )
            ],
          )
        : Icon(
            passiveIcon,
            color: AppTheme.theme.colorScheme.onBackground,
          );
  }
}
