import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => SettingsState();
}

class SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {

    Color rippleColor = Theme.of(context).colorScheme.secondaryContainer;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "General",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          settingItems(rippleColor , "Notifications", "lib/icons/notifications.png"),
          settingItems(rippleColor ,"Appearance", "lib/icons/appearance.png"),
          settingItems(rippleColor , "Privacy", "lib/icons/privacy.png"),
          settingItems(rippleColor ,"About", "lib/icons/about.png")
        ],
      ),
    );
  }

  Widget settingItems(Color rippleColor, String name, String iconPath) {
    return InkWell(
      splashColor: rippleColor,
      onTap: () {
        
      },
      child: Row(
        children: <Widget>[
          SizedBox(
            height: 60,
            width: 60,
            child: Image.asset(iconPath,
                color: Theme.of(context).colorScheme.primary),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
