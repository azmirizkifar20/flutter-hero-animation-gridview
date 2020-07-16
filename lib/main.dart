import 'package:flutter/material.dart';

import './detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // list data
  List<Container> daftarSuperhero = new List();
  var karakter = [
    {"nama": "Aquaman", "gambar": "aquaman.jpg"},
    {"nama": "Batman", "gambar": "batman.jpg"},
    {"nama": "Captain Amerika", "gambar": "captain.jpg"},
    {"nama": "Catwoman", "gambar": "catwoman.jpg"},
    {"nama": "Flash", "gambar": "flash.jpg"},
    {"nama": "Hulk", "gambar": "hulk.jpg"},
    {"nama": "Ironman", "gambar": "ironman.jpg"},
    {"nama": "Spiderman", "gambar": "spiderman.jpg"},
    {"nama": "Venom", "gambar": "venom.jpg"},
    {"nama": "Superman", "gambar": "superman.jpg"},
  ];

  void _buatlist() {
    for (var i = 0; i < karakter.length; i++) {
      final data = karakter[i];
      final String gambar = data['gambar'];

      daftarSuperhero.add(Container(
        padding: EdgeInsets.all(10.0),
        child: Card(
          child: Column(
            children: <Widget>[
              Hero(
                tag: data['nama'],
                child: Material(
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detail(data['nama'], gambar),
                      ),
                    ),
                    child: Image.asset("img/$gambar", fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(7.0)),
              Text(data['nama'], style: TextStyle(fontSize: 20.0))
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Super Hero',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: daftarSuperhero,
      ),
    );
  }
}
