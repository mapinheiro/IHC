import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' ;

class About extends StatelessWidget {
  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
    appBar: new AppBar(
      title: new Text(
        'Info',
        style: new TextStyle(
          fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
        ),
      ),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
    ),

    //Content of tabs
    body:
        new PageView(
           children: <Widget>[
             new Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 new Text(
                   "Horário: Todos os dias",
                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                 ),
                             new Text(
                                 "Almoço: 12:00 -> 14:00 \n"
                                     " Jantar : 19:00 -> 21:00 ",
                                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,textBaseline: TextBaseline.ideographic)
                             ),
                            new Center(
                                 child:
                                     Padding(padding: const EdgeInsets.only(top: 127.0),
                                        child: new FlatButton.icon(
                                            icon: Icon(Icons.call,size:35,color: Colors.red),
                                            onPressed: () => launch("tel://21312313"),
                                            label :Text("21312313",style: TextStyle(fontSize: 30)),
                                            ),
                                         ),
                            ),
                  ],
                             /*  new Table(
                                      border: TableBorder.all(),
                                      children:[
                                            TableRow(
                                              children: [
                                                TableCell(
                                                  child:
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      new Text("a")
                                                    ],
                                                  )
                                                )
                                              ],
                                            ),
                                      ],
                               ),*/

                         ),
                ],
              ),


  );
}