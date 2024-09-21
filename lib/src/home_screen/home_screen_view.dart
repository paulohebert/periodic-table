import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:periodic_table/src/home_screen/periodic_table_view.dart';
import '../settings/settings_view.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Container(
          padding: const EdgeInsets.only(top: 10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            isDarkTheme
                ? "assets/images/logo-dark.svg"
                : "assets/images/logo.svg",
            width: 300,
          ),
        )),
        toolbarHeight: 75,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: SafeArea(
          child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: const PeriodicTableView())),
    );
  }
}