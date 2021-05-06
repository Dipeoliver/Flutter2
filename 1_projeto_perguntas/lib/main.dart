import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      // String
      'texto': 'Qual e a sua cor favorita ?',
      // Object
      'resposta': [
        {'texto': 'Black', 'pontuacao': 10},
        {'texto': 'Red', 'pontuacao': 5},
        {'texto': 'Green', 'pontuacao': 3},
        {'texto': 'Yellow', 'pontuacao': 1},
      ],
    },
    {
      // String
      'texto': 'Qual e seu animal favorito ?',
      // Object
      'resposta': [
        {'texto': 'Dog', 'pontuacao': 10},
        {'texto': 'Horse', 'pontuacao': 5},
        {'texto': 'Cat', 'pontuacao': 3},
        {'texto': 'Fish', 'pontuacao': 1},
      ],
    },
    {
      // String
      'texto': 'Qual o seu instrutor favorito ?',
      // Object
      'resposta': [
        {'texto': 'Diego', 'pontuacao': 10},
        {'texto': 'Luiz', 'pontuacao': 5},
        {'texto': 'Mario', 'pontuacao': 3},
        {'texto': 'Jose', 'pontuacao': 1},
      ],
    },
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _pontuacaoTotal = 0;
      _perguntaSelecionada = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // Abaixo declaração imperativa --------------
    //
    // List<Widget> widgets = [];
    // ** metodo antigo (carregar o widget)
    // for (var textoResp in respostas) {
    //   widgets.add(Resposta(textoResp, _responder));
    // }
    // -------------------------------------------
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Perguntas!"),
          actions: [
            IconButton(
                icon: Icon(Icons.refresh_sharp),
                onPressed: _reiniciarQuestionario)
          ],
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoresponder: _responder,
              )
            : Result(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
