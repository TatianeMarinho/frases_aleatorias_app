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
                "Clique abaixo para gerar uma frase!",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                //botao com sombra
                onPressed: () {}, //funçao anonima
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
