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
            padding: const EdgeInsets.all(10.0),
            child: new Row(
              children: <Widget>[
                SizedBox(
                  child: Image.network(company.logo, fit: BoxFit.cover),
                  height: 50.0,
                  width: 50.0,
                ),
                new Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Text(company.name,
                            style: TextStyle(
                                fontSize: 25, /*fontWeight: FontWeight.bold*/),
                            textAlign: TextAlign.center),
                        Text(company.location,
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[600]),
                            textAlign: TextAlign.center)
                      ],
                    ))
              ],
            ),
          )),
    );
  }

  Card _oldBuildListItem(BuildContext context, Company company) {
    return Card(
      color: Colors.grey[300],
      margin: EdgeInsets.all(9),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: new CircleAvatar(
            backgroundImage: NetworkImage(company.logo),
            radius: 34,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CompanyWidget(company)),
            );
          },
          title: Text(company.name, style: TextStyle(fontSize: 22)),
          subtitle: Text(company.location, style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
