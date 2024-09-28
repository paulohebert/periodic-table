import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

import '../widgets/periodic_table.dart';
import 'settings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          height: 80,
          child: rive.RiveAnimation.asset(
            "assets/images/logo.riv",
            artboard: isDarkTheme ? "dark" : "light",
            placeHolder: const CircularProgressIndicator(),
            antialiasing: true,
            fit: BoxFit.contain,
          ),
        ),
        toolbarHeight: 80,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsScreen.routeName);
            },
          ),
        ],
      ),
      body: SafeArea(
          child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: const PeriodicTableWidget())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Informações',
        shape: const CircleBorder(),
        child: const Icon(Icons.info_outline),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 20,
        height: 55,
        notchMargin: 10,
        child: IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Row(
            children: <Widget>[
              isDarkTheme
                  ? Image.asset("assets/images/univasf-white.png")
                  : Image.asset("assets/images/univasf-black.png")
            ],
          ),
        ),
      ),
    );
  }
}
