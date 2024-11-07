import 'package:flutter/material.dart';

class ElementDetailsScreen extends StatelessWidget {
  const ElementDetailsScreen(
      {super.key, required this.name, required this.symbol});

  static const routeName = '/element_details';

  final String name;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Hero(
          flightShuttleBuilder: (flightContext, animation, flightDirection,
              fromHeroContext, toHeroContext) {
            return Material(
                color: Colors.transparent,
                textStyle: TextStyle(
                    fontSize: 20,
                    color: isDarkTheme ? Colors.white : Colors.black),
                child:
                    FittedBox(alignment: Alignment.center, child: Text(name)));
          },
          tag: name,
          child: Text(name),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Text("Símbolo: $symbol"),
          ),
        ]),
      ),
    );
  }
}
