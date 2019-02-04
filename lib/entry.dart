import 'package:flutter/material.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/entry_background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new Container(
            alignment: AlignmentDirectional(0, -0.7),
            child: Image.asset(
              "assets/logo.png",
              scale: 0.8,
            )),
        new Container(
          alignment: AlignmentDirectional(0, 0.7),
          child: new SizedBox(
            height: 50,
            width: 150,
            child: new RaisedButton(
              child: const Text('START',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              color: Color(0xFF302DAD),
              elevation: 10.0,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25.0)),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/listing');
              },
            ),
          ),
        ),
      ],
    ));
  }
}
