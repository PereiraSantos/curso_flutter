import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {

  final List<Map<String, Object>> perguntas;
  final int perguntasSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({Key? key,
    required this.perguntas,
    required this.perguntasSelecionada,
    required this.quandoResponder,
  }) : super(key: key);

  bool get temPerguntaSelecionada {
    return perguntasSelecionada < perguntas.length;
  }


  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas =  temPerguntaSelecionada
        ? perguntas[perguntasSelecionada].cast()['resposta']
        : [];

    return Column(
        children: [
          Questao(texto: perguntas[perguntasSelecionada].cast()['texto']),
          ...respostas.map((resp) {
              return Resposta(
              text: resp['texto'].toString(),
              onClick: () => quandoResponder(int.parse(resp['pontuacao'].toString())),
            );
          }).toList()
        ]
    );
  }
}

