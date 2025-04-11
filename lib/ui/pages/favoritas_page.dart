import 'package:criptomoedas/repository/favoritas_repository.dart';
import 'package:criptomoedas/ui/widgets/moeda_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritasPage extends StatefulWidget {
  const FavoritasPage({super.key});

  @override
  State<FavoritasPage> createState() => _FavoritasPageState();
}

class _FavoritasPageState extends State<FavoritasPage> {
  //late List<Moeda> moeda;

  @override
  Widget build(BuildContext context) {
    //moeda = Provider.of<FavoritasRepository>(context).lista;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Moedas Favoritas'),
      ),
      body: Consumer<FavoritasRepository>(
        builder: (context, favoritas, child) {
          return favoritas.lista.isEmpty
              ? ListTile(
                title: Text('Ainda não há moedas favoritas'),
              )
              : ListView.separated(
                itemBuilder: (context, index) {
                  return MoedaCard(moeda: favoritas.lista[index],);
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: favoritas.lista.length,
              );
        },
      ),
    );
  }
}
