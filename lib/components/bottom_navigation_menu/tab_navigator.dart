import 'package:covid_resource_app_master/screens/contribute/contribute.dart';
import 'package:covid_resource_app_master/screens/help/help.dart';
import 'package:covid_resource_app_master/screens/resources/color_detail_page.dart';
import 'package:covid_resource_app_master/screens/resources/resources.dart';
import 'package:covid_resource_app_master/screens/profile/profile.dart';
import 'package:flutter/material.dart';

import 'bottom_navigation.dart';

class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({this.navigatorKey, this.tabItem});
  final GlobalKey<NavigatorState> navigatorKey;
  final TabItem tabItem;

  void _push(BuildContext context, {int materialIndex: 500}) {
    var routeBuilders = _routeBuilders(context, materialIndex: materialIndex);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => routeBuilders[TabNavigatorRoutes.detail](context),
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context,
      {int materialIndex: 500}) {
    switch(this.tabItem) {
      case TabItem.resources: {
        return {
          TabNavigatorRoutes.root: (context) => Resources(
            color: activeTabColor[tabItem],
            title: tabName[tabItem],
            onPush: (materialIndex) =>
                _push(context, materialIndex: materialIndex),
          ),
          TabNavigatorRoutes.detail: (context) => ColorDetailPage(
            color: activeTabColor[tabItem],
            title: tabName[tabItem],
            materialIndex: materialIndex,
          ),
        };
      }
      break;
      case TabItem.contribute: {
        return {
          TabNavigatorRoutes.root: (context) => Contribute(
            color: activeTabColor[tabItem],
            title: tabName[tabItem],
            onPush: (materialIndex) =>
                _push(context, materialIndex: materialIndex),
          ),
          TabNavigatorRoutes.detail: (context) => ColorDetailPage(
            color: activeTabColor[tabItem],
            title: tabName[tabItem],
            materialIndex: materialIndex,
          ),
        };
      }
      break;
      case TabItem.help: {
        return {
          TabNavigatorRoutes.root: (context) => Help(
            color: activeTabColor[tabItem],
            title: tabName[tabItem],
            onPush: (materialIndex) =>
                _push(context, materialIndex: materialIndex),
          ),
          TabNavigatorRoutes.detail: (context) => ColorDetailPage(
            color: activeTabColor[tabItem],
            title: tabName[tabItem],
            materialIndex: materialIndex,
          ),
        };
      }
      break;
      case TabItem.profile: {
        return {
          TabNavigatorRoutes.root: (context) => Profile(
            color: activeTabColor[tabItem],
            title: tabName[tabItem],
            onPush: (materialIndex) =>
                _push(context, materialIndex: materialIndex),
          ),
          TabNavigatorRoutes.detail: (context) => ColorDetailPage(
            color: activeTabColor[tabItem],
            title: tabName[tabItem],
            materialIndex: materialIndex,
          ),
        };
      }
      break;
    }


  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name](context),
        );
      },
    );
  }
}