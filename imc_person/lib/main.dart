import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController weigthController = TextEditingController();
  TextEditingController heigthController = TextEditingController();
  String _info = 'Informe os campos acima!';

  void _resetFilds() {
    weigthController.text = '';
    heigthController.text = '';
    setState(() {
      _info = 'Informe os campos acima!';
      _formKey = GlobalKey<FormState>();
    });
  }

  void _calculate() {
    setState(() {
      double weigth = double.parse(weigthController.text);
      double heigth = double.parse(heigthController.text) / 100;
      double imc = weigth / (heigth * 2);

      if (imc < 18.6) {
        _info = 'IMC abaixo do peso ${imc.toStringAsPrecision(3)}';
      } else if (imc >= 18.6 && imc < 24.9) {
        _info = 'IMC Peso ideal ${imc.toStringAsPrecision(3)}';
      } else if (imc >= 24.9 && imc < 29.9) {
        _info = 'IMC Levemente acima do peso ${imc.toStringAsPrecision(3)}';
      } else if (imc >= 29.9 && imc < 34.9) {
        _info = 'IMC Obesidade Grau I ${imc.toStringAsPrecision(3)}';
      } else if (imc >= 34.9 && imc < 39.9) {
        _info = 'IMC Obesidade Grau II ${imc.toStringAsPrecision(3)}';
      } else {
        _info = 'IMC Obesidade Grau III ${imc.toStringAsPrecision(3)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora IMC'),
          centerTitle: true,
          backgroundColor: Colors.orange,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFilds,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Icon(Icons.person, color: Colors.red, size: 100),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Seu peso',
                          labelStyle: TextStyle(color: Colors.red)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                      controller: weigthController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Informe seu peso';
                        }
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Altura em (CM)',
                          labelStyle: TextStyle(color: Colors.red)),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                      controller: heigthController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Informe sua altura';
                        }
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Container(
                        height: 50.0,
                        child: RaisedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _calculate();
                            }
                          },
                          child: Text(
                            'Calcular',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    Text(
                      _info,
                      style: TextStyle(color: Colors.red, fontSize: 30),
                      textAlign: TextAlign.center,
                    )
                  ],
                ))));
  }
}
