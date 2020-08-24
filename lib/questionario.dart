import 'package:flutter/material.dart';
import 'package:perguntas/questao.dart';
import 'package:perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Questionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    if (temPerguntaSelecionada) {
      // obtém a lista de respostas para a pergunta selecionada
      List<Map<String, Object>> respMaps =
          perguntas[perguntaSelecionada]['respostas'];
      // mapeie a lista de mapas para uma lista de widgets
      List<Widget> respostas = respMaps
          .map((resp) =>
              Resposta(resp['texto'], () => quandoResponder(resp['pontuacao'])))
          .toList();

      return Column(
        children: <Widget>[
          Questao(perguntas[perguntaSelecionada]['texto']),
          ...respostas, // forma de lista cada item da lista
        ],
      );
    }
    return null;
  }
}
