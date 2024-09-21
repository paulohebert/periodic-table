import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class Element {
  String name;
  int row;
  int col;

  Element(this.name, this.row, this.col);
}

class PeriodicTableView extends StatelessWidget {
  const PeriodicTableView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Element> elementosTabelaPeriodica = [
      Element('Hidrogênio', 1, 1),
      Element('Hélio', 1, 18),
      Element('Lítio', 2, 1),
      Element('Berílio', 2, 2),
      Element('Boro', 2, 13),
      Element('Carbono', 2, 14),
      Element('Nitrogênio', 2, 15),
      Element('Oxigênio', 2, 16),
      Element('Flúor', 2, 17),
      Element('Neônio', 2, 18),
      Element('Sódio', 3, 1),
      Element('Magnésio', 3, 2),
      Element('Alumínio', 3, 13),
      Element('Silício', 3, 14),
      Element('Fósforo', 3, 15),
      Element('Enxofre', 3, 16),
      Element('Cloro', 3, 17),
      Element('Argônio', 3, 18),
      Element('Potássio', 4, 1),
      Element('Cálcio', 4, 2),
      Element('Escândio', 4, 3),
      Element('Titânio', 4, 4),
      Element('Vanádio', 4, 5),
      Element('Cromo', 4, 6),
      Element('Manganês', 4, 7),
      Element('Ferro', 4, 8),
      Element('Cobalto', 4, 9),
      Element('Níquel', 4, 10),
      Element('Cobre', 4, 11),
      Element('Zinco', 4, 12),
      Element('Gálio', 4, 13),
      Element('Germânio', 4, 14),
      Element('Arsênio', 4, 15),
      Element('Selênio', 4, 16),
      Element('Bromo', 4, 17),
      Element('Criptônio', 4, 18),
      Element('Rubídio', 5, 1),
      Element('Estrôncio', 5, 2),
      Element('Ítrio', 5, 3),
      Element('Zircônio', 5, 4),
      Element('Nióbio', 5, 5),
      Element('Molibdênio', 5, 6),
      Element('Tecnécio', 5, 7),
      Element('Rutênio', 5, 8),
      Element('Ródio', 5, 9),
      Element('Paládio', 5, 10),
      Element('Prata', 5, 11),
      Element('Cádmio', 5, 12),
      Element('Índio', 5, 13),
      Element('Estanho', 5, 14),
      Element('Antimônio', 5, 15),
      Element('Telúrio', 5, 16),
      Element('Iodo', 5, 17),
      Element('Xenônio', 5, 18),
      Element('Césio', 6, 1),
      Element('Bário', 6, 2),
      Element('Lantânio', 6, 3),
      Element('Cério', 6, 4),
      Element('Praseodímio', 6, 5),
      Element('Neodímio', 6, 6),
      Element('Promécio', 6, 7),
      Element('Samário', 6, 8),
      Element('Európio', 6, 9),
      Element('Gadolínio', 6, 10),
      Element('Térbio', 6, 11),
      Element('Disprósio', 6, 12),
      Element('Hólmio', 6, 13),
      Element('Érbio', 6, 14),
      Element('Túlio', 6, 15),
      Element('Itérbio', 6, 16),
      Element('Lutécio', 6, 17),
      Element('Háfnio', 6, 4),
      Element('Tântalo', 6, 5),
      Element('Tungstênio', 6, 6),
      Element('Rênio', 6, 7),
      Element('Ósmio', 6, 8),
      Element('Irídio', 6, 9),
      Element('Platina', 6, 10),
      Element('Ouro', 6, 11),
      Element('Mercúrio', 6, 12),
      Element('Tálio', 6, 13),
      Element('Chumbo', 6, 14),
      Element('Bismuto', 6, 15),
      Element('Polônio', 6, 16),
      Element('Astato', 6, 17),
      Element('Radônio', 6, 18),
      Element('Frâncio', 7, 1),
      Element('Rádio', 7, 2),
      Element('Actínio', 7, 3),
      Element('Tório', 7, 4),
      Element('Protactínio', 7, 5),
      Element('Urânio', 7, 6),
      Element('Netúnio', 7, 7),
      Element('Plutônio', 7, 8),
      Element('Amerício', 7, 9),
      Element('Cúrio', 7, 10),
      Element('Berquélio', 7, 11),
      Element('Califórnio', 7, 12),
      Element('Einstênio', 7, 13),
      Element('Férmio', 7, 14),
      Element('Mendelévio', 7, 15),
      Element('Nobélio', 7, 16),
      Element('Laurêncio', 7, 17),
      Element('Rutherfórdio', 7, 4),
      Element('Dúbnio', 7, 5),
      Element('Seabórgio', 7, 6),
      Element('Bóhrio', 7, 7),
      Element('Hássio', 7, 8),
      Element('Meitnério', 7, 9),
      Element('Darmstádio', 7, 10),
      Element('Roentgênio', 7, 11),
      Element('Copernício', 7, 12),
      Element('Nihônio', 7, 13),
      Element('Fleróvio', 7, 14),
      Element('Moscóvio', 7, 15),
      Element('Livermório', 7, 16),
      Element('Tenessino', 7, 17),
      Element('Oganessônio', 7, 18)
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: LayoutGrid(
        columnSizes: repeat(18, [200.px]),
        rowSizes: [
          40.px,
          ...repeat(7, [1.fr])
        ],
        //rowGap: 5,
        //columnGap: 5,
        children: [
          for (int i = 0; i < 18; i++)
            GridPlacement(
              columnStart: i,
              columnSpan: 1,
              rowStart: 0,
              rowSpan: 1,
              child: Container(
                  alignment: Alignment.center, child: Text((i + 1).toString())),
            ),
          for (int i = 0; i < 118; i++)
            GridPlacement(
              columnStart: elementosTabelaPeriodica[i].col - 1,
              columnSpan: 1,
              rowStart: elementosTabelaPeriodica[i].row,
              rowSpan: 1,
              child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0x00000000).withOpacity(1),
                          offset: const Offset(0, 0),
                          //blurRadius: 10,
                          spreadRadius: 1,
                        )
                      ],
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.primaries[
                          Random().nextInt(Colors.primaries.length)]),
                  alignment: Alignment.center,
                  child: Text(elementosTabelaPeriodica[i].name)),
            )
        ],
      ),
    );
  }
}
