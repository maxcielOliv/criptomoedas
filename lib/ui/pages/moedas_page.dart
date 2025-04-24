import 'package:criptomoedas/configs/app_settings.dart';
import 'package:criptomoedas/model/moeda.dart';
import 'package:criptomoedas/repository/favoritas_repository.dart';
import 'package:criptomoedas/ui/pages/moeda_detalhe_page.dart';
import 'package:criptomoedas/repository/moeda_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  late NumberFormat real;
  late Map<String, String> localizacao;
  List<Moeda> selecionadas = [];
  late FavoritasRepository favoritas;

  readNumberFormat() {
    localizacao = context.watch<AppSettings>().locale;
    real = NumberFormat.currency(
      locale: localizacao['locale'],
      name: localizacao['name'],
    );
  }

  changeLanguageButton() {
    final locale = localizacao['locale'] == 'pt_BR' ? 'en_US' : 'pt_BR';
    final name = localizacao['name'] == 'R\$' ? '\$' : 'R\$';
    return PopupMenuButton(
      icon: Icon(Icons.language, color: Colors.white,),
      itemBuilder:
          (context) => [
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.swap_vert),
                title: Text('Usar $locale'),
              ),
              onTap: () {
                context.read<AppSettings>().setLocale(locale, name);
              },
            ),
          ],
    );
  }

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: Text('Cripto Moedas'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          changeLanguageButton(),
        ],
      );
    } else {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          '${selecionadas.length} selecionadas',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueGrey[50],
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),
      );
    }
  }

  mostrarDetalhes(Moeda moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MoedaDetalhePage(moeda: moeda)),
    );
  }

  limparSelecionadas() {
    setState(() {
      selecionadas = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    favoritas = Provider.of<FavoritasRepository>(context);
    readNumberFormat();
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            leading:
                selecionadas.contains(tabela[index])
                    ? CircleAvatar(child: Icon(Icons.check))
                    : Image.asset(tabela[index].icone),
            title: Row(
              children: [
                Text(
                  tabela[index].nome,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                if (favoritas.lista.any((fav) => fav.sigla == tabela[index].sigla))
                  Icon(Icons.circle, color: Colors.amber, size: 8),
              ],
            ),
            trailing: Text(real.format(tabela[index].preco)),
            selected: selecionadas.contains(tabela[index]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              setState(() {
                (selecionadas.contains(tabela[index]))
                    ? selecionadas.remove(tabela[index])
                    : selecionadas.add(tabela[index]);
              });
            },
            onTap: () => mostrarDetalhes(tabela[index]),
          );
        },
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, _) => const Divider(),
        itemCount: tabela.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          selecionadas.isNotEmpty
              ? FloatingActionButton.extended(
                icon: Icon(Icons.star, color: Colors.white),
                onPressed: () {
                  favoritas.saveAll(selecionadas);
                  limparSelecionadas();
                },
                label: Text(
                  'Favoritar',
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              )
              : null,
    );
  }
}
