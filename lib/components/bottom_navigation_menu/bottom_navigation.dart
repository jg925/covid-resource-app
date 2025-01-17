import 'package:flutter/material.dart';

enum TabItem { resources, contribute, help, profile }

Map<TabItem, String> tabName = {
  TabItem.resources: 'Resources',
  TabItem.contribute: 'Contribute',
  TabItem.help: 'Help Chat',
  TabItem.profile: 'Profile Page',
};

Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.resources: Colors.red,
  TabItem.contribute: Colors.green,
  TabItem.help: Colors.blue,
  TabItem.profile: Colors.purple,
};

Map<TabItem, IconData> tabIcon = {
  TabItem.resources: Icons.search,
  TabItem.contribute: Icons.event,
  TabItem.help: Icons.chat_bubble,
  TabItem.profile: Icons.person,
};



class BottomNavigation extends StatelessWidget {
  BottomNavigation({this.currentTab, this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(tabItem: TabItem.resources),
        _buildItem(tabItem: TabItem.contribute),
        _buildItem(tabItem: TabItem.help),
        _buildItem(tabItem: TabItem.profile),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem({TabItem tabItem}) {
    String text = tabName[tabItem];
    IconData icon = tabIcon[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        color: _colorTabMatching(item: tabItem),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: _colorTabMatching(item: tabItem),
        ),
      ),
    );
  }

  Color _colorTabMatching({TabItem item}) {
    return currentTab == item ? activeTabColor[item] : Colors.grey;
  }


}