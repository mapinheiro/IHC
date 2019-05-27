import 'package:flutter/material.dart';
import 'package:nova/functions.dart';

class TakeawayAsk1 extends StatelessWidget {
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
           body: new SingleChildScrollView(
             padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    PaginatedDataTable(
                      header: Text('Prato'),
                      columns: TabelaColunas,
                      source: PratoDataSource(),
                      rowsPerPage: 7,
                    ),

                    SizedBox(height: 20.0),
                /*    new Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new RaisedButton(

                          padding:const EdgeInsets.only(left: 10,right:10) ,
                          onPressed:() {

                            Navigator.pushNamed(context,'/takeawayAsk2');
                          },

                          color: Colors.red[900],

                          child: const Text(
                            'Continuar',
                            style: TextStyle(fontSize: 30,color:Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],

                    ),*/
                  ],
                ),
              ),

      floatingActionButton: new FloatingActionButton.extended(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          backgroundColor: Colors.red[900],
          onPressed:() {
            Navigator.pushNamed(context, '/takeawayAsk2');

          },

          label: Text('Continuar',style: TextStyle(fontSize: 20))
      ),

    );


  }
}
/*String dropdownValue = 'One';
class TakeawayAsk2 extends StatefulWidget{
  TakeawayAsk2State createState()=> TakeawayAsk2State();
}
class TakeawayAsk2State extends State<TakeawayAsk2> {

  @override
  Widget build(BuildContext context) {
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
          new SingleChildScrollView(
            child:
            ),
          ),

          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new RaisedButton(

                padding: const EdgeInsets.only(left: 10, right: 10),
                onPressed: () {
                  Navigator.pushNamed(context, '/takeawayAsk1');
                },
                color: Colors.red[900],

                child: const Text(
                  'Continuar',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}*/


const TabelaColunas = <DataColumn>[
  DataColumn(
    label: const Text('Selecionar Tudo'),
  ),
  DataColumn(
    label: const Text('Preço'),
  )
];

class Prato {
  Prato(this.name, this.price, this.tipo);
  final String name;
  final String price;
  final String tipo;
  bool selected = false;
}

class PratoDataSource extends DataTableSource {
  int _selectCount = 0;
  final List<Prato> _prato = <Prato>[
    new Prato('Bife à Pica-Peixe', '7.00€', 'Carne'),
    new Prato('Arroz de Pato', '7.00€', 'Carne'),
    new Prato('Picanha', '11.00€', 'Carne'),
    new Prato('Bacalhau à Casa', '7.00€', 'Peixe'),
    new Prato('Lulas Recheadas', '9.00€', 'Peixe'),
    new Prato('Bacalhau com natas','9.00€', 'Peixe'),
    new Prato('Polvo à Lagareiro', '9.00€', 'Peixe'),
  ];

  @override
  DataRow getRow(int index) {
    if (index >= _prato.length) return null;
    final Prato pratos = _prato[index];
    return DataRow.byIndex(
        index: index,
        selected: pratos.selected,
        onSelectChanged: (bool value) {
          if (pratos.selected != value) {
            _selectCount += value ? 1 : -1;
            assert(_selectCount >= 0);
            pratos.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell> [
          DataCell (Text('${pratos.name}')),
          DataCell (Text('${pratos.price}')),
        ]
    );
  }
 /* Widget getselectedPlates(Prato p, BuildContext context){
    if(p.selected == true){
      return new ListTile(itemBuilder: rowCount))
    }*/
//  }
  @override
  int get rowCount => _prato.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectCount;
}