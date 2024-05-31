import 'package:flutter/material.dart';

class TeksUtama extends StatefulWidget {
  const TeksUtama({Key? key}) : super(key: key);

  @override
  State<TeksUtama> createState() => _StateTeksUtama();
}

class _StateTeksUtama extends State<TeksUtama> {
  var listNama = [
    'Virda',
    'Ana',
    'Mia',
    'Wulan',
    'Nanda',
    'Ummu'
  ];
  var listWarna = [
    Colors.red,
    Colors.purple,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.deepPurple,
    Colors.cyan,
    Colors.blue,
    Colors.yellow
  ];
  int index = 0;

  void incrementIndex() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.cyan[50],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5,
            offset: Offset(30.0, 30.0),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Apa kabar',
            textDirection: TextDirection.ltr,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          Text(
            listNama[index % listNama.length],
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: listWarna[index % listWarna.length],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<_StateTeksUtama> teksUtamaKey = GlobalKey<_StateTeksUtama>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halo Dunia',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Halo Dunia',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: TeksUtama(key: teksUtamaKey),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Random',
          child: Icon(Icons.refresh),
          onPressed: () {
            teksUtamaKey.currentState?.incrementIndex();
          },
        ),
      ),
    );
  }
}
