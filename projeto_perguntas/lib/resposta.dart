import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {

  final String text;
  final void Function() onClick;

  const Resposta({Key? key, required this.text, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: onClick,
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}

