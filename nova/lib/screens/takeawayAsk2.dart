import 'package:flutter/material.dart';
import 'package:nova/functions.dart';

//String dropdownValue = 'Bitoque';
class TakeawayAsk2 extends StatefulWidget{
  TakeawayAsk2State createState()=> TakeawayAsk2State();
}

final a = 1;

class TakeawayAsk2State extends State <TakeawayAsk2> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //App Bar

      drawer: Functions.menuL(context),
      appBar: new AppBar(
        title: new Text(
          'Take - Away',
          style: new TextStyle(
            fontSize:
            Theme
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
        PaginatedDataTable(
        header: Text('Acompanhamentos'),
        columns: TabelaColunas,
        source: AcompanhamentoDataSource(),
          rowsPerPage: 7,
      ),
      ],
    ),
      ),
      floatingActionButton:

      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Container(
              height:20,
              width: 10),

          FloatingActionButton.extended(
              heroTag: 'btn1',

              shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              backgroundColor: Colors.red[900],
              onPressed: () {
                Navigator.pushNamed(context, '/takeaway');
              },

              label: Text('Cancelar', style: TextStyle(fontSize: 20))
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 20,
            width: 10,
          ),
          FloatingActionButton.extended(
            heroTag: 'btn2',
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: Colors.red[900],
            onPressed: () {
              Navigator.pushNamed(context, '/takeawayFinal');
            },

            label: Text('Continuar', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
const TabelaColunas = <DataColumn>[
  DataColumn(
    label: const Text('Selecionar tudo'),

  ),
  DataColumn(
      label: const Text('Preço')
  ),

];

class Acompanhamento {
  Acompanhamento(this.name,this.price);
  final String name;
  final String price;
  bool selected = false;
}

class AcompanhamentoDataSource extends DataTableSource {
  int _selectCount = 0;
  final List<Acompanhamento> _acomp = <Acompanhamento>[
    new Acompanhamento('Batatas Cozidas','2.00€'),
    new Acompanhamento('Batatas Fritas','4.00€'),
    new Acompanhamento('Cenoura e Ervilhas','4.00€'),
    new Acompanhamento('Arroz Branco','4.00€'),
    new Acompanhamento('Arroz Feijão Preto','4.00€'),
    new Acompanhamento('Salada','5.00€'),
    new Acompanhamento('Migas','4.00€'),
  ];

  @override
  DataRow getRow(int index) {
    if (index >= _acomp.length) return null;
    final Acompanhamento a = _acomp[index];
    return DataRow.byIndex(
        index: index,
        selected: a.selected,
        onSelectChanged: (bool value) {
          if (a.selected != value) {
            _selectCount += value ? 1 : -1;
            assert(_selectCount >= 0);
            a.selected = value;
          //  _acomp.add(a.selected);
            notifyListeners();
          }
        },
        cells: <DataCell> [
          DataCell (Text('${a.name}')),
          DataCell (Text('${a.price}')),
        ]
    );
  }
  /* Widget getselectedPlates(Prato p, BuildContext context){
    if(p.selected == true){
      return new ListTile(itemBuilder: rowCount))
    }*/
//  }
  @override
  int get rowCount => _acomp.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectCount;
}
/*

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

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
    if (root.children.isEmpty)
      return Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(root.title),
            Switch(
              value: true,
              onChanged: (_) {},
            )
          ]),
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
*/
