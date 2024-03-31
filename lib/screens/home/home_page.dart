import 'package:flutter/material.dart';
import 'package:hello_world/screens/home/widgets/menu_setting_section.dart';
import 'package:hello_world/screens/home/widgets/profile_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProfileSection(name: "Jason Steward", email: "jason@tech.co"),
            MenuSetting(
                title: "Setting",
                description: "Switch options and modify app customization that match your preferences",
                icon: Icons.settings_outlined
            ),
            MenuSetting(
                title: "Analysis Page",
                description: "See your account analysis including content engagement, likes, comments and etc.",
                icon: Icons.analytics_outlined
            ),
            MenuSetting(
                title: "Focus Mode",
                description: "Inactive",
                icon: Icons.filter_center_focus
            ),
          ],
        ),
      ),
    );
  }
}
