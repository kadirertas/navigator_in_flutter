import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(accentColor: Colors.grey),
        //home: HomePage(),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          RoutePink.routeName: (context) => RoutePink(),
          RouteGreen.routeName: (context) => RouteGreen(),
          RouteGrey.routeName: (context) => RouteGrey(),
        });
  }
}

class Kullanici {
  String? ad;
  int? yas;
  String? adres;

  Kullanici({this.ad, this.yas, this.adres});
}

class HomePage extends StatelessWidget {
  final Kullanici kullanici_1 =
      Kullanici(ad: 'Metin', adres: 'Beşiktaş', yas: 40);

  static String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Sayfalar Arası Geçiş / Navigation')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('HomePage'),
        TextButton(
            child: Text('Git -> Route Pink'),
            onPressed: () {
              Navigator.pushNamed(context, RoutePink.routeName,
                  arguments: kullanici_1);
            })
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE PINK
///////////////////////////////////////////////

class RoutePink extends StatelessWidget {
  static String routeName = '/routePink';

  //Kullanici yerelKullanici = ModalRoute.of(context).settings.arguments;

  @override
  Widget build(BuildContext context) {
    Kullanici yerelKullanici =
        ModalRoute.of(context)!.settings.arguments as Kullanici;

    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Route Pink')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
            'kullanıcı adı : ${yerelKullanici.ad}, yaşı:${yerelKullanici.yas}, adres:${yerelKullanici.adres}'),
        TextButton(
            child: Text('Git -> Route Green'),
            onPressed: () {
              Navigator.pushNamed(context, RouteGreen.routeName);
            }),
        TextButton(
            child: Text('Geri Dön'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREEN
///////////////////////////////////////////////

class RouteGreen extends StatelessWidget {
  static String routeName = '/routeGreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Route Green')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Şu an RouteGreen en üstte'),
        TextButton(
            child: Text('Git -> Route Grey'),
            onPressed: () {
              Navigator.pushNamed(context, RouteGrey.routeName);
            }),
        TextButton(
            child: Text('Geri Dön'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}

///////////////////////////////////////////////
///   ROUTE GREY
///////////////////////////////////////////////

class RouteGrey extends StatelessWidget {
  static String routeName = '/routeGrey';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Route Grey')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text('Şu an RouteGrey en üstte'),
        TextButton(child: Text('Git -> ....'), onPressed: () {}),
        TextButton(
            child: Text('Geri Dön'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ])),
    );
  }
}
