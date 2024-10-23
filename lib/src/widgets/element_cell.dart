import 'package:flutter/material.dart';
import '../constants/color_palette.dart';
import '../screens/element_details.dart';
import '../models/element.dart';
import 'cell.dart';

class ElementCell extends StatelessWidget {
  const ElementCell({super.key, required this.element, this.onTap});

  final ChemicalElement element;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Cell(
        color: colors[element.category] ?? Colors.transparent,
        onTap: () {
          Navigator.restorablePushNamed(context, ElementDetailsScreen.routeName,
              arguments: element.name);
        },
        child: Padding(
            padding: const EdgeInsets.all(7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${element.atomicNumber}",
                  textWidthBasis: TextWidthBasis.parent,
                  style: const TextStyle(color: Colors.white),
                ),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          element.symbol,
                          textScaler: const TextScaler.linear(2),
                          style: const TextStyle(color: Colors.white),
                        ))),
                Hero(
                    flightShuttleBuilder: (flightContext, animation,
                        flightDirection, fromHeroContext, toHeroContext) {
                      return Material(
                          color: Colors.transparent,
                          child: Center(child: Text(element.name)));
                    },
                    tag: element.name,
                    child: Text(
                      element.name,
                      style: const TextStyle(color: Colors.white),
                    ))
              ],
            )));
  }
}
