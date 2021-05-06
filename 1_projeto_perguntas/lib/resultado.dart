import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoreiniciarQuestionario;
  Result(this.pontuacao, this.quandoreiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Você precisa melhorar! sua pontuação foi: $pontuacao';
    } else if (pontuacao < 12) {
      return 'Parabéns, sua pontuação foi: $pontuacao';
    } else if (pontuacao < 18) {
      return 'Impressionante, sua pontuação foi: $pontuacao';
    } else {
      return 'Nivel Jedi, sua pontuação foi: $pontuacao';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // pegar tamanho maximo da tela.
      margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              fraseResultado,
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 15),
            child: ElevatedButton(
              onPressed: quandoreiniciarQuestionario,
              child: Text('Reiniciar'),
            ),
          ),
        ],
      ),
    );
  }
}
