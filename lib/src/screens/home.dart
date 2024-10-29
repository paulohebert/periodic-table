import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive;

import '../widgets/about.dart';
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
          height: 70,
          child: rive.RiveAnimation.asset(
            "assets/images/logo.riv",
            artboard: isDarkTheme ? "dark" : "light",
            placeHolder: const CircularProgressIndicator(),
            antialiasing: true,
            fit: BoxFit.contain,
          ),
        ),
        toolbarHeight: 70,
        leading: IconButton(
          icon: const Icon(Icons.info_outline_rounded),
          onPressed: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return const About();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsScreen.routeName);
            },
          ),
        ],
      ),
      body: const SafeArea(child: PeriodicTable()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            builder: (BuildContext context) {
              return SizedBox(
                height: 240,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      child: const Center(
                        child: Text(
                          'Grupos',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 20.0,
                                height: 20.0,
                                color: const Color(0xFF4BD169),
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
                                color: const Color(0xFFF0B214),
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
                                color: const Color(0xFFF07014),
                              ),
                              const SizedBox(width: 8.0),
                              const Text('Não-metais'),
                            ],
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 71, 89),
                      ),
                      child: const Text(
                        'X',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              );
            },
          );
        },
        tooltip: 'Informações',
        shape: const CircleBorder(),
        child: const Icon(Icons.assessment_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 20,
        height: 50,
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
