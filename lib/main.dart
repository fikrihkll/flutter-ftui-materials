import 'package:flutter/material.dart';
import 'package:hello_world/providers/theme_provider.dart';
import 'package:hello_world/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        builder: (context, widget) {
          ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeProvider.themeMode,
            darkTheme: ThemeData(
              colorScheme: ColorScheme
                  .fromSeed(seedColor: Colors.deepPurple)
                  .copyWith(background: Colors.black45, onSurface: Colors.white),
              useMaterial3: true,
            ),
            theme: ThemeData(
              colorScheme: ColorScheme
                  .fromSeed(seedColor: Colors.deepPurple)
                  .copyWith(background: Colors.white, onSurface: Colors.black87),
              useMaterial3: true,
            ),
            home: const HomePage(),
          );
        }
    );
  }
}