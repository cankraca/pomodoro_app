import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_provider.dart';
import '../../provider/time_provider.dart';
import '../../screens/settings.dart';

class DarkModeButton extends StatelessWidget {
  const DarkModeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return IconButton(
      onPressed: () {
        themeProvider.switchTheme();
      },
      icon:
          Icon(themeProvider.isDarkMode ? Icons.nights_stay : Icons.light_mode),
    );
  }
}

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Study Effectively',
      style: TextStyle(fontFamily: 'Grenze'),
    );
  }
}

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    void navigateSettingsPage() {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SettingsPage(),
      ));
    }

    return IconButton(
      onPressed: timerProvider.isEqual ? navigateSettingsPage : null,
      icon: const Icon(Icons.settings),
    );
  }
}
