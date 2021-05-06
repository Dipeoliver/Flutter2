import 'package:flutter/cupertino.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  // criei 3 parametros para receber
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;

  // esta recebendo parametro do tipo int
  final void Function(int) quandoresponder;

// @.. parametros obrigatorios
  Questionario(
      {@required this.perguntas,
      @required this.perguntaSelecionada,
      @required this.quandoresponder});

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, Object>> perguntas = [
    // se tiver pergunta selecionada renderiza a tela
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['resposta']
        : null;
    // acima se tiver no indice exibe na tela

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              // passando os parametros para o componente separado
              // estou passando (string[indice][texto do Objeto]).
              Questao(perguntas[perguntaSelecionada]['texto']),
        ),
        // (class Resposta)componente criado em outro arquivo
        // passando 2 parametros (1 string, 2 funcao)
        // abaixo aboragem declarativa ---------------
        // o map trasnforma lista em lista ex. lista de string em widget
        //
        // antes ...respostas.map((resp) => Resposta(resp['texto'], quandoresponder))
        ...respostas.map((resp) {
          return Resposta(
            resp['texto'],
            () => quandoresponder(resp['pontuacao']),
          );
        }).toList()
      ],
    );
  }
}
