import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;

  final void Function() onSelected;
  Resposta(this.texto, this.onSelected);

  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        // quando clicado chamo a função passada por parametro
        onPressed: onSelected,
        child: Text(
          texto,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
