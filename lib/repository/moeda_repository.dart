import 'package:criptomoedas/model/moeda.dart';

class MoedaRepository {
  static List<Moeda> tabela = [
    Moeda(icone: 'assets/images/btc.png', nome: 'Bitcoin', sigla: 'BTC', preco: 483481.00),
    Moeda(icone: 'assets/images/ethereum.png', nome: 'Ethereum', sigla: 'ETH', preco: 1909.42),
    Moeda(icone: 'assets/images/xrp.png', nome: 'XRP', sigla: 'XRP', preco: 12.16),
    Moeda(icone: 'assets/images/cardano.png', nome: 'Cardano', sigla: 'ADA', preco: 0.6819),
  ];
}