import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(title: 'Contador de Pessoas', home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _texto = 'Liberado!!';

  void chengNumber(numero) {
    setState(() {
      _people += numero;
      if (_people < 0) {
        this._texto = 'Valor negativo';
      } else if (_people > 10) {
        this._texto = 'Muito cheio';
      } else {
        this._texto = 'LIBERADO';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Pessoas: $_people',
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 34)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text('+1',
                          style: TextStyle(fontSize: 50, color: Colors.white)),
                      onPressed: () {
                        chengNumber(1);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text('-1',
                          style: TextStyle(fontSize: 50, color: Colors.white)),
                      onPressed: () {
                        chengNumber(-1);
                      }),
                )
              ],
            ),
            Text(
              '$_texto',
              style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 30),
            )
          ],
        )
      ],
    );
  }
}
