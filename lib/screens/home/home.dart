// screens/home/home.dart

import 'package:covid_resource_app_master/components/bottom_navigation_menu/bottom_navigation.dart';
import 'package:covid_resource_app_master/components/bottom_navigation_menu/tab_navigator.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  TabItem _currentTab = TabItem.resources;
  Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.resources: GlobalKey<NavigatorState>(),
    TabItem.contribute: GlobalKey<NavigatorState>(),
    TabItem.help: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
        !await _navigatorKeys[_currentTab].currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.resources) {
            // select 'main' tab
            _selectTab(TabItem.resources);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.resources),
          _buildOffstageNavigator(TabItem.contribute),
          _buildOffstageNavigator(TabItem.help),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
