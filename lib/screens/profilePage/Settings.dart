import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 class Settings extends StatefulWidget {
   Settings({Key? key}) : super(key: key);
 
   @override
   State<Settings> createState() => _SettingsState();
 }
 
 class _SettingsState extends State<Settings> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      body : Padding(
  padding: const EdgeInsets.all(10),
  child: ListView(
    children: [
      // User card
      BigUserCard(
        cardColor: Colors.red,
        userName: "Babacar Ndong",
        userProfilePic: AssetImage("assets/logo.png"),
        cardActionWidget: SettingsItem(
          icons: Icons.edit,
          iconStyle: IconStyle(
            withBackground: true,
            borderRadius: 50,
            backgroundColor: Colors.yellow[600],
          ),
          title: "Modify",
          subtitle: "Tap to change your data",
          onTap: () {
            print("OK");
          },
        ),
      ),
      SettingsGroup(
        items: [
          SettingsItem(
            onTap: () {},
            icons: CupertinoIcons.pencil_outline,
            iconStyle: IconStyle(),
            title: 'Appearance',
            subtitle: "Make Ziar'App yours",
          ),
          SettingsItem(
            onTap: () {},
            icons: Icons.dark_mode_rounded,
            iconStyle: IconStyle(
              iconsColor: Colors.white,
              withBackground: true,
              backgroundColor: Colors.red,
            ),
            title: 'Dark mode',
            subtitle: "Automatic",
            trailing: Switch.adaptive(
              value: false,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
      SettingsGroup(
        items: [
          SettingsItem(
            onTap: () {},
            icons: Icons.info_rounded,
            iconStyle: IconStyle(
              backgroundColor: Colors.purple,
            ),
            title: 'About',
            subtitle: "Learn more about Ziar'App",
          ),
        ],
      ),
      // You can add a settings title
      SettingsGroup(
        settingsGroupTitle: "Account",
        items: [
          SettingsItem(
            onTap: () {},
            icons: Icons.exit_to_app_rounded,
            title: "Sign Out",
          ),
          SettingsItem(
            onTap: () {},
            icons: CupertinoIcons.delete_solid,
            title: "Delete account",
            titleStyle: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ],
  ),
),
     );
   }
 }
