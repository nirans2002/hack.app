import 'package:flutter/material.dart';
import 'package:hack/providers/authenticationService.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatelessWidget {
  static const routName = "/app-settings";
  static Color bgColour = Colors.blue.shade200;

  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthenticationService>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English'),
              ),
            ],
          ),
          SettingsSection(title: Text('Account'), tiles: [
            SettingsTile(
              title: Text('Phone Number'),
              leading: Icon(Icons.phone_android_outlined),
              onPressed: (BuildContext context) {},
            ),
            SettingsTile(
              title: Text('Email Id'),
              leading: Icon(Icons.email_outlined),
              onPressed: (BuildContext context) {},
            ),
            SettingsTile(
              title: Text('Sign Out'),
              leading: Icon(Icons.logout_outlined),
              onPressed: (BuildContext context) {
                auth.signOut();
              },
            ),
          ]),
          SettingsSection(
            title: Text('Security'),
            tiles: [
              SettingsTile.switchTile(
                initialValue: true,
                title: Text('Lock app in background'),
                leading: Icon(Icons.local_activity_outlined),
                onToggle: (bool value) {},
              ),
              SettingsTile(
                title: Text('Change Password'),
                leading: Icon(Icons.password_outlined),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
          SettingsSection(
            title: Text('Misc'),
            tiles: [
              SettingsTile(
                title: Text('Terms and Services'),
                leading: Icon(Icons.text_format_sharp),
                onPressed: (BuildContext context) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
