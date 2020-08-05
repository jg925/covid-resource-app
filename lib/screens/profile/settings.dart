import 'package:covid_resource_app_master/app.dart';
import 'package:covid_resource_app_master/screens/profile/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'package:settings_ui/settings_ui.dart';


class Setting extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
    child:
    SettingsList(
      sections: [
        SettingsSection(
          title: 'Settings',
          tiles: [
            SettingsTile(
              title: 'Language',
              subtitle: 'English',
              leading: Icon(Icons.language),
              onTap: () {},
            ),
            SettingsTile.switchTile(
              title: 'Push Notifications',
              leading: Icon(Icons.notifications),
              switchValue: true,
              onToggle: (bool value) {},
            ),
            SettingsTile.switchTile(
            title: 'Private Profile',
            leading: Icon(Icons.person),
            switchValue: true,
            onToggle: (bool value) {},
            ),
          ],
        ),
      ],
    ),
    );
  }
}
