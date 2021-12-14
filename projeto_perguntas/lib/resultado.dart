import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {

  final int? pontuacao;
  final void Function() quandoReinicarQuestionario;

  const Resultado({Key? key, this.pontuacao, required this.quandoReinicarQuestionario}) : super(key: key);

  String get fraseResultado {
    if(pontuacao! < 8){
      return "Parabens";
    }else if(pontuacao! < 12){
      return "Voce é bom";
    }else if(pontuacao! < 16){
      return 'Impresionante';
    }else{
      return "Nivel jedi";
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(fraseResultado, style: const TextStyle(fontSize: 20))),
        TextButton(
            onPressed: quandoReinicarQuestionario,
            child: const Text('Reiniciar',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
        )
      ],
    );
  }
}

