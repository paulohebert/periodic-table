import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'group.dart';
import 'lanthanides_actinides_container.dart';
import 'element_cell.dart';
import '../constants/elements.dart';

class PeriodicTableWidget extends StatelessWidget {
  const PeriodicTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: LayoutGrid(
        columnSizes: repeat(18, [auto]),
        rowSizes: [
          40.px,
          ...repeat(7, [1.fr])
        ],
        children: [
          ..._buildGroups(),
          ..._buildElements(),
          const GridPlacement(
              rowStart: 6,
              rowSpan: 2,
              columnStart: 2,
              child: LanthanidesActinidesContainer())
        ],
      ),
    ));
  }

  List<Widget> _buildGroups() {
    return List.generate(
        18,
        (index) => GridPlacement(
            rowStart: 0,
            columnStart: index,
            child: Group(
              num: index + 1,
            )));
  }

  List<Widget> _buildElements() {
    return chemicalElements
        .map((element) => GridPlacement(
              rowStart: element.period,
              columnStart: element.group - 1,
              child: ElementCell(element: element),
            ))
        .toList();
  }
}
