import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import '../constants/element_list.dart';
import '../widgets/element_cell_list.dart';
import '../models/element.dart';
import 'element_cell.dart';

class PeriodicTableWidget extends StatelessWidget {
  const PeriodicTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
        child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: LayoutGrid(
        columnSizes: [
          200.px,
          200.px,
          auto,
          ...repeat(18 - 3, [200.px])
        ],
        rowSizes: [
          40.px,
          ...repeat(7, [1.fr])
        ],
        //rowGap: 5,
        //columnGap: 5,
        children: [
          for (int i = 0; i < 18; i++)
            GridPlacement(
              rowStart: 0,
              columnStart: i,
              child: Container(
                  alignment: Alignment.center, child: Text((i + 1).toString())),
            ),
          ...elementList.map((item) {
            return GridPlacement(
                rowStart: item is List<ChemicalElement>
                    ? item.first.row
                    : item is ChemicalElement
                        ? item.row
                        : 0,
                columnStart: item is List<ChemicalElement>
                    ? item.first.col - 1
                    : item is ChemicalElement
                        ? item.col - 1
                        : 0,
                child: item is List<ChemicalElement>
                    ? ElementCellListWidget(elements: item)
                    : item is ChemicalElement
                        ? ElementCellWidget(element: item)
                        : const Text("ERRO"));
          })
        ],
      ),
    ));
  }
}
