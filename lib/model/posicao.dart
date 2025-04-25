import 'package:criptomoedas/model/moeda.dart';

class Posicao {
  Moeda moeda;
  double quantidade;

  Posicao({
    required this.moeda,
    required this.quantidade
  });
}