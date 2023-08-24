import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/auto_start_provider.dart';
import '../../provider/notification_provider.dart';
import '../../provider/theme_provider.dart';

class AutoStartSwitch extends StatelessWidget {
  const AutoStartSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final autoStartProvider = Provider.of<AutoStartProvider>(context);
    return SwitchListTile(
      title: const Text('Autostart'),
      value: AutoStartProvider.autoStart,
      onChanged: (value) {
        value = !value;
        autoStartProvider.switchMode();
      },
    );
  }
}

class SettingsNotificationSwitch extends StatelessWidget {
  const SettingsNotificationSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);
    return SwitchListTile(
      title: const Text('Notifications'),
      value: NotificationProvider.isActive,
      onChanged: (value) {
        value = !value;
        notificationProvider.switchMode();
      },
    );
  }
}

class SettingsDarkModeSwitch extends StatelessWidget {
  const SettingsDarkModeSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SwitchListTile(
      title: const Text('Dark Mode'),
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        value = !value;
        themeProvider.switchTheme();
      },
    );
  }
}
