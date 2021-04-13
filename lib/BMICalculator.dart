import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new BMIState();
  }
}

class BMIState extends State<BMICalculator> {
  double _calculation;
  String _calcResult;
  String _result;

  TextEditingController _ageFieldController = new TextEditingController();
  TextEditingController _heightFieldController = new TextEditingController();
  TextEditingController _weightFieldController = new TextEditingController();

  void _calculateBMI() {
    double height = double.parse(_heightFieldController.text);
    double weight = double.parse(_weightFieldController.text);

    if (height != null && weight != null) {
      setState(() {
        _calculation = (weight / (height * height)) * 10000;
        _calcResult = _calculation.toStringAsFixed(2);
        if (_calculation < 18.5) {
          _result = 'Anda termasuk dalam kategori kurus';
        } else if (_calculation >= 18.5 && _calculation <= 24.9) {
          _result = 'Anda termasuk dalam kategori ideal';
        } else if (_calculation >= 25.0 && _calculation <= 24.9) {
          _result = 'Anda termasuk dalam kategori gemuk';
        } else {
          _result = 'Anda termasuk dalam kategori obesitas';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigoAccent[400],
        title: new Text('Kalkulator BMI'),
      ),
      body: new ListView(
        padding: const EdgeInsets.all(3.5),
        children: <Widget>[
          new Image.asset(
            "images/unipa.png",
            height: 120.0,
            width: 150.0,
          ),
          new Container(
            color: Colors.lightBlue[400],
            padding: const EdgeInsets.all(5.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  controller: _ageFieldController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    labelText: 'Umur',
                    icon: new Icon(Icons.calendar_today),
                  ),
                ),
                new TextField(
                  controller: _heightFieldController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: 'Tinggi (Cm)', icon: new Icon(Icons.info)),
                ),
                new TextField(
                  controller: _weightFieldController,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: 'Berat (Kg)',
                      icon: new Icon(Icons.shutter_speed)),
                ),
                new Padding(padding: const EdgeInsets.all(7.5)),
                new RaisedButton(
                    onPressed: _calculateBMI,
                    child: new Text(
                      'Hitung',
                      style: new TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: Colors.indigo[900],
                    textColor: Colors.pinkAccent[400])
              ],
            ),
          ),
          new Padding(padding: const EdgeInsets.all(5.5)),
          new Container(
            alignment: Alignment.topCenter,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  _calcResult != null ? '$_calcResult' : '',
                  style: new TextStyle(
                      color: Colors.deepOrange[400],
                      fontSize: 44.5,
                      fontWeight: FontWeight.w800),
                ),
                new Text(
                  _result != null ? _result : '',
                  style: new TextStyle(fontSize: 28.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
