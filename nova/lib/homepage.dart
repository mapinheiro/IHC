import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(1, 1),

];

List<Widget> _tiles = const <Widget>[
const _Example01Tile(Colors.grey, Icons.bookmark,"Ementa"),
const _Example01Tile(Colors.grey, Icons.restaurant,"Take-Away"),
const _Example01Tile(Colors.grey, Icons.restaurant,"Reserva"),
const _Example01Tile(Colors.grey, Icons.info_outline,"Info"),
];

class Example01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Pica-Peixe'),

        ),
        body: new Padding(
            padding: const EdgeInsets.only(top: 127.0),
            child: new StaggeredGridView.count(
              crossAxisCount: 2,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(14.0),

            )));
  }
}

class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData, this.text);

  final Color backgroundColor;
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return new Card(

      color: backgroundColor,
      child: new InkWell(

        onTap: () {},
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