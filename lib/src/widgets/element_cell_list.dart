import 'package:flutter/material.dart';
import '../widgets/element_cell.dart';
import '../models/element.dart';

class ElementCellListWidget extends StatefulWidget {
  const ElementCellListWidget({super.key, required this.elements});

  final List<ChemicalElement> elements;

  @override
  State<ElementCellListWidget> createState() => _ElementCellListState();
}

class _ElementCellListState extends State<ElementCellListWidget> {
  static bool _active = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 500),
      child: Row(
        children: [
          ElementCellWidget(
            element: widget.elements.first,
            onTap: () {
              setState(() {
                _active = !_active;
              });
            },
          ),
          if (_active)
            ...widget.elements
                .map((element) => ElementCellWidget(element: element))
        ],
      ),
    );
  }
}
