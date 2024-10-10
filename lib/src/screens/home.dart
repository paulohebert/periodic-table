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
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        'Grupos',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            color: Color(0xFF4BD169), 
                          ),
                          const SizedBox(width: 8.0),
                          const Text('Metais'),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            color: Color(0xFFF0B214), 
                          ),
                          const SizedBox(width: 8.0),
                          const Text('Semimetais'),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 20.0,
                            height: 20.0,
                            color: Color(0xFFF07014),
                          ),
                          const SizedBox(width: 8.0),
                          const Text('Não-metais'),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
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
