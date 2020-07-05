import 'package:flutter/material.dart';
import 'package:flutter_perguntas/questao.dart';

void main() {
  runApp(PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  void _responder() {
    setState(() {
      perguntaSelecionada++;
    });
    print(perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final pergunstas = [
      "Qual é sua cor favorita?",
      "Qual é seu animal favorito?",
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Perguntas"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Questao(pergunstas[perguntaSelecionada]),
              RaisedButton(
                child: Text("Resposta 1"),
                onPressed: _responder,
              ),
              RaisedButton(
                child: Text("Resposta 2"),
                onPressed: _responder,
              ),
              RaisedButton(
                child: Text("Resposta 3"),
                onPressed: _responder,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
