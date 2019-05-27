import 'package:flutter/material.dart';
import 'package:nova/functions.dart';
import 'package:nova/screens/takeawayAsk1.dart';
class Takeaway extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    final takeaway = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor : Colors.transparent,
        radius: 100.0, //tamanho da imagem

        child: Image.asset("assets/takeaway.png"),
      ),
    );
    return new Scaffold(

      //App Bar
      drawer: Functions.menuL(context),
          appBar: new AppBar(
              title: new Text(
                'Take - Away',
                style: new TextStyle(
                  fontSize: Theme
                      .of(context)
                      .platform == TargetPlatform.iOS ? 17.0 : 20.0,
                ),
              ),
              elevation: Theme
                  .of(context)
                  .platform == TargetPlatform.iOS ? 0.0 : 4.0,
            ),

      //Content of tabs
          body: new PageView(
            children: <Widget>[

              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                      'Não tem nenhum pedido efetuado!',
                      style: TextStyle(fontWeight: FontWeight.bold )
                  ),
                  takeaway,
                  new RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    onPressed:() {
                      Navigator.pushNamed(context,'/takeawayAsk1');
                    },
                    color: Colors.red[900],
//                      child: Container(
//                        color: Colors.red[900],
                    child: const Text(
                          'Criar Pedido',
                          style: TextStyle(fontSize: 30,color:Colors.white),
                          textAlign: TextAlign.center,


                    ),
                  ),
                 ],
          ),
        ],
      ),
    );
  }
}