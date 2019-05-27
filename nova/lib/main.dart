import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './screens/about.dart' as _aboutPage;
import './screens/support.dart' as _supportPage;
import './screens/takeaway.dart' as _takeawayPage;
import './screens/takeawayAsk1.dart' as _takeawayAsk1Page;
import './screens/takeawayAsk2.dart' as _takeawayAsk2Page;
import './screens/takeawayFinal.dart' as _takeawayFinalPage;
import './screens/reserva.dart' as _reservaPage;
import './screens/ementa.dart' as _ementaPage;
import './screens/ementaPrincipal.dart' as _ementaPrincipalPage;
import './screens/NovaRerserva.dart' as _NovaReservaPage;

import 'package:nova/homepage.dart';
import 'package:nova/menu.dart';
void main() => runApp(new MaterialApp(
  title: 'Pica-Peixe',
  debugShowCheckedModeBanner: false,
  theme: new ThemeData(
      primarySwatch: Colors.blueGrey,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.red[900], backgroundColor: Colors.white
  ),
  routes: <String, WidgetBuilder>{
    '/homepage': (BuildContext context) => new Home(),
    '/menu':(BuildContext context) => new Menu(),
  },
  home: new Home(),
  onGenerateRoute: (RouteSettings settings) {
    switch (settings.name) {
      case '/about': return new FromRightToLeft(
        builder: (_) => new _aboutPage.About(),
        settings: settings,
      );
      case '/support': return new FromRightToLeft(
        builder: (_) => new _supportPage.Support(),
        settings: settings,
      );
      case '/takeaway': return new FromRightToLeft(
        builder:(_) => new _takeawayPage.Takeaway(),
        settings:settings
      );
      case '/reserva': return new FromRightToLeft(
          builder:(_) => new _reservaPage.Reserva(),
          settings:settings
      );
      case '/ementa': return new FromRightToLeft(
          builder:(_) => new _ementaPage.Ementa(),
          settings:settings
      );
      case '/takeawayAsk1': return new FromRightToLeft(
        builder: (_) => new _takeawayAsk1Page.TakeawayAsk1(),
        settings: settings,
      );
      case '/takeawayAsk2': return new FromRightToLeft(
        builder: (_) => new _takeawayAsk2Page.TakeawayAsk2(),
        settings: settings,
      );
      case '/takeawayFinal': return new FromRightToLeft(
        builder: (_) => new _takeawayFinalPage.TakeawayFinal(),
        settings: settings,
      );
	case '/ementaPrincipal': return new FromRightToLeft(
          builder:(_) => new _ementaPrincipalPage.EmentaPrincipal(),
          settings:settings
      );
	case '/NovaReserva': return new FromRightToLeft(
        builder: (_) => new _NovaReservaPage.NovaReserva(),
        settings: settings,
      );

    }
  },
  // routes: <String, WidgetBuilder> {
  //   '/about': (BuildContext context) => new _aboutPage.About(),
  // }
));

class FromRightToLeft<T> extends MaterialPageRoute<T> {
  FromRightToLeft({ WidgetBuilder builder, RouteSettings settings })
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {

    if (settings.isInitialRoute)
      return child;

    return new SlideTransition(
      child: new Container(
        decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black26,
                blurRadius: 25.0,
              )
            ]
        ),
        child: child,
      ),
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      )
          .animate(
          new CurvedAnimation(
            parent: animation,
            curve: Curves.fastOutSlowIn,
          )
      ),
    );
  }
  @override Duration get transitionDuration => const Duration(milliseconds: 400);
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}
class TabsState extends State<Tabs> {

  PageController _tabController;

  var _title_app = "Adeus que já te vi";
  int _tab = 0;

/*
  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    this._title_app = TabItems[0].title;
  }
*/
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      new Scaffold(
        //App Bar
        appBar: new AppBar(
          title: new Text(
            _title_app,
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
        body: Container(
          child: RaisedButton(onPressed: () =>
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) =>
                  new Home())

              ),
          ),
        ),
      );
}
