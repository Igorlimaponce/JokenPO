import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage('assets/padrao.png');
  String _mensagem = "Faça sua escolha!";
  int _vitoriasUsuario = 0;
  int _vitoriasApp = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    setState(() {
      _imagemApp = AssetImage('assets/$escolhaApp.png');

      if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
          (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
          (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
        _mensagem = "Você ganhou!";
        _vitoriasUsuario++;
      } else if (escolhaUsuario == escolhaApp) {
        _mensagem = "Empate!";
      } else {
        _mensagem = "Você perdeu!";
        _vitoriasApp++;
      }
    });
  }

  Color _getCorResultado() {
    if (_mensagem == "Você ganhou!") {
      return Colors.blue;
    } else if (_mensagem == "Você perdeu!") {
      return Colors.red;
    } else {
      return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        title: const Text('JokenPO'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do APP:",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: _imagemApp, height: 100),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              _mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: _getCorResultado(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              "Vitórias - Você: $_vitoriasUsuario | APP: $_vitoriasApp",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              "Escolha uma opção abaixo:",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("papel"),
                    child: const Image(
                      image: AssetImage('assets/papel.png'),
                      height: 100,
                    ),
                  ),
                  const Text(
                    "Papel",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("pedra"),
                    child: const Image(
                      image: AssetImage('assets/pedra.png'),
                      height: 100,
                    ),
                  ),
                  const Text(
                    "Pedra",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => _opcaoSelecionada("tesoura"),
                    child: const Image(
                      image: AssetImage('assets/tesoura.png'),
                      height: 100,
                    ),
                  ),
                  const Text(
                    "Tesoura",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
