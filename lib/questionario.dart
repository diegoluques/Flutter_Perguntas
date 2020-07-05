import 'package:flutter/material.dart';
import 'package:flutter_perguntas/questao.dart';
import 'package:flutter_perguntas/resposta.dart';

class Qustionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  Qustionario({
    @required this.perguntas,
    @required this.perguntaSelecionada,
    @required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]["respostas"]
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]["texto"]),
        ...respostas.map((resp) {
          return Resposta(
            resp["texto"],
            () => quandoResponder(resp["pontuacao"]),
          );
        }).toList(),
      ],
    );
  }
}
