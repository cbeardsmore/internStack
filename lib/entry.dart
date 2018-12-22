import 'package:flutter/material.dart';
import 'listing.dart';

class EntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/entry_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        new Container(
            alignment: AlignmentDirectional(0, -0.6),
            child: Image.asset("assets/logo.png", scale: 0.8,)),
        new Container(
          alignment: AlignmentDirectional(0, 0.9),
          child: new SizedBox(
            height: 70,
            width: 200,
            child: new RaisedButton(
              child: const Text('Start',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
              color: Colors.black54,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListingPage(title: 'internStack')),
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}