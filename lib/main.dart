import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(), //MaterialApp
      debugShowCheckedModeBanner: false,
    ),
  ); //remove a faixa de debug
}

class Home extends StatefulWidget {
  //usa para avisar que a pag tem estados que podem mudar
  const Home({super.key}); //para performance e organizaçao do flutter

  @override //sobrescreve a classe padrao
  State<Home> createState() => _HomeState(); //para mandar usar a logica e os dados da classe _HomeState
}

class _HomeState extends State<Home> {
  //classe que define o app

  final _frases = [
    "Enquanto tu for o que os outros querem, tu não vai ser nada",
    "Separados somos fortes, juntos, imbatíveis",
    "Erros do passado, vale repensar",
    "Quem não é solução também faz parte do problema",
    "Prefiro cair do que me curvar",
    "Subversivos não nascem prontos, são moldados",
    "E se a carapuça serviu, normal, Crianças sempre levam tudo pro lado pessoal",
    "Abelha não explica pra mosca que mel é melhor que merda",
    "Ninguém liga pra tua história até você vencer, então, vença",
    "Preso ao progresso, é a minha sentença",
    "Enquanto avanço, eu vejo no retrovisor aquilo que foi conquistado",
    "Todo dia quero, Me libertar aos poucos da melancolia",
    "O mundo pertence aos que são mais pra frente",
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    var sorteador = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[sorteador];
    });
  }

  @override //?
  Widget build(BuildContext context) {
    //constroi a interface
    return Scaffold(
      //esqueleto da tela
      appBar: AppBar(
        //barra do topo
        title: Text("Frase do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        //corpo do app
        child: Container(
          padding: EdgeInsets.all(30), //margem interna
          decoration: BoxDecoration(
            //borda da tela
            border: Border.all(width: 3, color: Colors.amber),
          ),
          child: Column(
            //organiza na vertical
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly, //distribui os filhos c/espaços iguais entre eles
            crossAxisAlignment: CrossAxisAlignment
                .center, //alinha tudo no centro da largura da coluna
            children: <Widget>[
              Image.asset("images/logo.jpg"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                //botao com sombra
                onPressed: _gerarFrase, //açao do botao
                style: ElevatedButton.styleFrom(
                  //onde define o design do botao
                  backgroundColor: Colors.deepOrange, // cor de fundo
                  padding: const EdgeInsets.all(5),
                  shape: RoundedRectangleBorder(
                    // deixar o botao arredondado
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Gerar Frase",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
