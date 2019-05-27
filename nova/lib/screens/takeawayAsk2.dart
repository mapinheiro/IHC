import 'package:flutter/material.dart';
import 'package:nova/functions.dart';

//String dropdownValue = 'Bitoque';
/*class TakeawayAsk2 extends StatefulWidget{
  TakeawayAsk2State createState()=> TakeawayAsk2State();
}
*/
final a = 1;
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
     body:  new PageView(
       children: <Widget>[
          new Row(
            children: <Widget>[
              Expanded(
                flex:40,
                child: SizedBox(
                  height: 300.0,

                  child:
                  new ListView.builder(
                    itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
                    itemCount: data.length,


                ),
              ),
              ),
               new Divider(),
               //SizeBox(height:20,width:20),
               Expanded(
               flex: 70,

               child: SizedBox(
                height: 50,
                width: 50,


               child:

               new Column(

                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
               children:<Widget>[
               new RaisedButton(

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
                  ],
                  ),
               ),
               ),

      ],
     ),




            ],

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
                    Text(root.title),
                  Switch(
                    value:true,
                    onChanged: (_){},
                  )
                ]
                  ),

            ),

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