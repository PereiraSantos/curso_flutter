import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  var _perguntasSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita?',
      'resposta': [
        {'texto':'Preto','pontuacao': 10},
        {'texto':'Vermehlho','pontuacao': 8},
        {'texto':'Verde','pontuacao': 6},
        {'texto':'Branco','pontuacao': 5},
      ]
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'resposta': [
        {'texto':'Coelho','pontuacao': 3},
        {'texto':'Elefante','pontuacao': 6},
        {'texto':'Leão','pontuacao': 7},
      ]
    },
    {
      'texto': 'Qual se intrutor favorito?',
      'resposta': [
        {'texto':'Maria','pontuacao': 9},
        {'texto':'João','pontuacao': 7},
        {'texto':'Leo','pontuacao': 5},
        {'texto':'Pedro','pontuacao': 3},
    ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntasSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao){
    if(temPerguntaSelecionada){
      setState(() {
        _perguntasSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntasSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:  const Center(child: Text('Perguntas')),
        ),
        body: temPerguntaSelecionada ?
        Questionario(
            perguntas: _perguntas,
            quandoResponder: _responder,
          perguntasSelecionada: _perguntasSelecionada,
        )
            :  Resultado(pontuacao: _pontuacaoTotal, quandoReinicarQuestionario: _reiniciarQuestionario)
      ),
    );
  }
}
