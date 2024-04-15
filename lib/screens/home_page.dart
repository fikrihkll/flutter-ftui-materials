import 'package:flutter/material.dart';
import 'package:hello_world/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late ThemeProvider _themeProvider;

  @override
  Widget build(BuildContext context) {
    _themeProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Hi, Global State Management"),
            Switch(
                value: _themeProvider.isDarkMode,
                onChanged: (newValue) {
                  _themeProvider.toggleTheme(newValue);
                }
            )
          ],
        ),
      ),
    );
  }
}
