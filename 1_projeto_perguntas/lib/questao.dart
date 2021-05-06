import 'package:flutter/material.dart';

// exemplo de um componente criado separado.

// classe que e para ter apenas atributos imutaveis
class Questao extends StatelessWidget {
  final String texto;
  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // pegar tamanho maximo da tela.
      margin: EdgeInsets.fromLTRB(10, 10, 10, 15),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
