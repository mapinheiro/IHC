import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nova/functions.dart';

final logo = Hero(
  tag: 'hero',
  child: CircleAvatar(
    backgroundColor : Colors.transparent,
    radius: 100.0, //tamanho da imagem
    child: Image.asset("assets/picapeixe.png"),
  ),
);
List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.fit(2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),

];

List<Widget> _tiles = const <Widget>[

const _HomeTile(Colors.grey, Icons.restaurant,"Ementa",'/ementa'),
const _HomeTile(Colors.grey, Icons.restaurant,"Take-Away",'/takeaway'),
const _HomeTile(Colors.grey, Icons.calendar_today,"Reserva",'/reserva'),
const _HomeTile(Colors.grey, Icons.info_outline,"Info",'/about'),
];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      drawer: Functions.menuL(context),
        appBar: new AppBar(
          title: new Text('Pica-Peixe'),

        ),
        body:
        new Padding(
            padding: const EdgeInsets.only(top: 127.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 2,
              staggeredTiles: _staggeredTiles,
              children:
                _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(14.0),


            )));
  }
}

class _HomeTile extends StatelessWidget {
  const _HomeTile(this.backgroundColor, this.iconData, this.text, this.dir);
  final Color backgroundColor;
  final IconData iconData;
  final String text;
  final String dir;


  @override
  Widget build(BuildContext context) {
    return new Card(

      color: backgroundColor,
      child: new InkWell(

        onTap: () {
          Navigator.pushNamed(context, dir);
          },
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Icon(

                  iconData,
                  color: Colors.white,
                ),
                Text(text, style: TextStyle(

                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),)
              ],
            )
          ),
        ),
      ),
    );
  }
}