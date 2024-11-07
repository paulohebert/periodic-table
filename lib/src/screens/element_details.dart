import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/element_details.dart';

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
                  child: FittedBox(
                      alignment: Alignment.center, child: Text(name)));
            },
            tag: name,
            child: Text(name),
          ),
        ),
        body: FutureBuilder<ChemicalElementDetails>(
            future: _loadElementData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Erro ao carregar os dados'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('Nenhum dado encontrado'));
              } else {
                final data = snapshot.data!;
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: Text(
                          "Descrição: ${data.summary}",
                          softWrap: true,
                        ),
                      ),
                    ]);
              }
            }));
  }

  Future<ChemicalElementDetails> _loadElementData() async {
    final String response = await rootBundle.loadString('json/$symbol.json');
    final Map<String, dynamic> data = json.decode(response);
    return ChemicalElementDetails.fromJson(data);
  }
}
