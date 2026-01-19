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

  final List<Color> _coresPaleta = [
    Color(0xFFBFB0A3),
    Color(0xFF593A27),
    Color(0xFFA67153),
    Color(0xFF260F07),
  ];

  var _fraseGerada = "Clique abaixo para gerar uma frase!";
  Color _corAtual = Color(0xFF593A27);

  void _gerarFrase() {
    var sorteador = Random().nextInt(_frases.length);
    var sortearCor = Random().nextInt(_coresPaleta.length);

    setState(() {
      _fraseGerada = _frases[sorteador];
      _corAtual = _coresPaleta[sortearCor];
    });
  }

  Color _corDoTexto(Color corDeFundo) {
    return corDeFundo.computeLuminance() > 0.4
        ? const Color(0xFF260F07)
        : const Color(0xFFD9D9D9);
  }

  @override //?
  Widget build(BuildContext context) {
    //constroi a interface
    return Scaffold(
      //esqueleto da tela
      appBar: AppBar(
        //barra do topo
        title: Text(
          "Frases Retilianas",
          style: TextStyle(color: _corDoTexto(_corAtual)),
        ),
        backgroundColor: _corAtual, // a barra muda de cor
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: _corAtual.withValues(alpha: 0.15),
        ), //pega a cor atual e deixa mais clara
        //corpo do app
        child: Column(
          //organiza na vertical
          mainAxisAlignment: MainAxisAlignment
              .start, //distribui os filhos c/espaços iguais entre eles
          crossAxisAlignment: CrossAxisAlignment
              .center, //alinha tudo no centro da largura da coluna
          children: <Widget>[
            ClipRRect(
              //para arredondar os cantos de imagens
              borderRadius: BorderRadius.circular(80),
              child: Image.asset(
                "images/logo.jpg",
                height: 120, //difine a altura da imagem
              ),
            ),

            const Spacer(), // empurra o que vem abaixo para o meio

            Text(
              _fraseGerada,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: _corAtual, // para mudar a cor do texto
              ),
            ),

            const Spacer(),

            ElevatedButton(
              //botao com sombra
              onPressed: _gerarFrase, //açao do botao
              style: ElevatedButton.styleFrom(
                //onde define o design do botao
                backgroundColor: _corAtual, // cor de fundo
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  // deixar o botao arredondado
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "PRÓXIMA FRASE",
                style: TextStyle(
                  fontSize: 18,
                  color: _corDoTexto(_corAtual),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
