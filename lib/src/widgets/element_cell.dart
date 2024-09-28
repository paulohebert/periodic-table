import 'package:flutter/material.dart';
import '../constants/color_palette.dart';
import '../screens/element_details.dart';
import '../models/element.dart';

class ElementCellWidget extends StatelessWidget {
  const ElementCellWidget({super.key, required this.element, this.onTap});

  final ChemicalElement element;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return AnimatedContainer(
      width: 200,
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
      child: Material(
        //shape: const RoundedRectangleBorder(
        //    side: BorderSide(width: 2, color: Colors.white)),
        color: colors[element.category],
        child: InkWell(
          //customBorder: const RoundedRectangleBorder(
          //    borderRadius: BorderRadius.all(Radius.circular(20))),
          onTap: onTap ??
              () {
                Navigator.restorablePushNamed(
                    context, ElementDetailsScreen.routeName,
                    arguments: element.name);
              },
          child: SizedBox.expand(
              child: Center(
                  child: Hero(
            flightShuttleBuilder: (flightContext, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              return Material(
                  color: Colors.transparent,
                  textStyle: TextStyle(
                      fontSize: 20,
                      color: isDarkTheme ? Colors.white : Colors.black),
                  child: FittedBox(
                      alignment: Alignment.center, child: Text(element.name)));
            },
            tag: element.name,
            child: Text(
              element.name,
              style: const TextStyle(color: Colors.white),
            ),
          ))),
        ),
      ),
    );
  }
}
