import 'package:flutter/material.dart';
import 'package:nova/functions.dart';

//String dropdownValue = 'Bitoque';
/*class TakeawayAsk2 extends StatefulWidget{
  TakeawayAsk2State createState()=> TakeawayAsk2State();
}
*/
class TakeawayAsk2 extends StatelessWidget  {
  @override
  Widget build (BuildContext context) {
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
     body:  new SingleChildScrollView(

      child:
          new Row(
            children: <Widget>[
              Expanded(
                child: SizedBox(
                  height: 300.0,
                  child:
                  new ListView.builder(
                    itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
                    itemCount: data.length,
                ),
              ),
                ),
            ],

      /*
      new ListView.builder(
          itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
            itemCount: data.length,

          ),
          */
          /*
          SizedBox(height: 380.0, width: 320.0),
              new RaisedButton(

                padding:const EdgeInsets.all(10) ,
                onPressed:() {
                  Navigator.pushNamed(context,'/takeawayFinal');
                },
                color: Colors.red[900],


                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 30,color:Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
          ),
          */
          // SizedBox(height: 50.0),
        /*  new Column(

            children:<Widget>[
              new RaisedButton(

                padding:const EdgeInsets.only(left: 10,right:10) ,
                onPressed:() {
                  Navigator.pushNamed(context,'/takeawayAsk1');
                },
                color: Colors.red[900],

                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 30,color:Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
      ],*/

          //),

     ),
    ),
    );

  }
}
class Entry {
  Entry(this.title,[this.children = const <Entry>[]]);

  final String title;

  final List<Entry> children;

}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry(
    'Bitoque',

    <Entry>[

      Entry('Batatas Fritas'),
      Entry('Arroz'),
      Entry('Ovo Estrelado'),
      Entry('Salada'),

    ],
  ),
   /*Entry(
    'Chapter B',
    <Entry>[
      Entry('Section B0'),
      Entry('Section B1'),
    ],
  ),
  */
  /*Entry(
    'Chapter C',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',
        <Entry>[
          Entry('Item C2.0'),
          Entry('Item C2.1'),

        ],
      ),
    ],
  ),
  */
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return Container(
        child:Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 32.0,
            ),
            child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                    Text(root.title),
                       SizedBox(

                         width:30,
                        height: 30,
                         child: FloatingActionButton( onPressed: () => {},

                         tooltip: 'Increment',
                           child: Icon(Icons.add),

                       ),
                       ),

                ]
            ),
                ]
            )
        )
    );
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}