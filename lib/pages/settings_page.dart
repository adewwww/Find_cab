import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDark = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/user_profile.jpg'), // optional
          ),
          const SizedBox(height: 10),
          const Text("John Doe", style: TextStyle(fontSize: 18)),
          const Text("johndoe@example.com",
              style: TextStyle(color: Colors.grey)),
          const Divider(height: 32),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: isDark,
            onChanged: (value) {
              themeProvider.toggleTheme(value);
            },
          ),
          // More settings can go here...
        ],
      ),
    );
  }
}
