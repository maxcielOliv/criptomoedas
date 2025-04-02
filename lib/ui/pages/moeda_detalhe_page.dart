import 'package:criptomoedas/model/moeda.dart';
import 'package:flutter/material.dart';

class MoedaDetalhePage extends StatefulWidget {
  final Moeda moeda;
  const MoedaDetalhePage({super.key, required this.moeda});

  @override
  State<MoedaDetalhePage> createState() => _MoedaDetalhePageState();
}

class _MoedaDetalhePageState extends State<MoedaDetalhePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(widget.moeda.nome, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
