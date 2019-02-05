import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/company.dart';
import 'company_widget.dart';

class CompanyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  StreamBuilder _buildList(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance.collection('companies').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return new Center(child: CircularProgressIndicator());
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                Company company =
                    Company.fromDocument(snapshot.data.documents[index]);
                return _buildListItem(context, company);
              });
        });
  }

  GestureDetector _buildListItem(BuildContext context, Company company) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompanyWidget(company)),
        );
      },
      child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)),
          color: Theme.of(context).cardColor,
          margin: EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
            child: new Row(
              children: <Widget>[
                SizedBox(
                  child: Image.network(company.logo, fit: BoxFit.cover),
                  height: 50.0,
                  width: 50.0,
                ),
                new Expanded(
                    child: Column(

                      children: <Widget>[
                        Text(company.name,
                            style: Theme.of(context).textTheme.display1,
                            textAlign: TextAlign.center),
                        Text(company.location,
                            style: Theme.of(context).textTheme.display2,
                            textAlign: TextAlign.center)
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}