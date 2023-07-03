import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  
  var _imagemGerada = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo:";
  void _opcaoSelecionada(String escolhaUsuario){
      var opcoes = ["pedra", "papel", "tesoura"];
      var numero = Random().nextInt(3);
      var escolhaApp = opcoes[numero];
      switch(escolhaApp){
        case "pedra":
          setState(() {
            _imagemGerada = AssetImage("imagens/pedra.png");
          });
          break;
        case "papel":
          setState(() {
            _imagemGerada = AssetImage("imagens/papel.png");
          });
          break;
        case "tesoura":
          setState(() {
            _imagemGerada = AssetImage("imagens/tesoura.png");
          });
          break;
      }
      if(
          (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
          (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
          (escolhaUsuario == "tesoura" && escolhaApp == "papel")
      ) {
          setState(() {
            _mensagem = "Você ganhou!!!";
          });
      }else if(
          (escolhaUsuario == "pedra" && escolhaApp == "papel") ||
          (escolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
          (escolhaUsuario == "papel" && escolhaApp == "tesoura")
      ){
        setState(() {
          _mensagem = "Você perdeu lixo, excremento, bostinha, fudido, pobre, espero que você morra amanhã!";
        });
      }else{
        setState(() {
          _mensagem = "empate de boiola!";
        });
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JOKENPO"),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Escolha do app:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
            )),
            Image(image: _imagemGerada,),
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(_mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: Image.asset("imagens/pedra.png", height: 100,),
                    onTap: () => _opcaoSelecionada("pedra"),
                  ),
                  GestureDetector(
                    child: Image.asset("imagens/papel.png", height: 100,),
                    onTap: () => _opcaoSelecionada("papel"),
                  ),
                  GestureDetector(
                    child: Image.asset("imagens/tesoura.png", height: 100,),
                    onTap: () => _opcaoSelecionada("tesoura"),
                  ),
                ],
              ),
            )

            //ImagemAPP,
            //resultado,
            //linha com 3 imagens
          ],
        ),
      ),
    );
  }
}
