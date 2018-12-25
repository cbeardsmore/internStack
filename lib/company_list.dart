import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'company.dart';
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
          if (!snapshot.hasData) return const Text('Loading...');

          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
                Company company = _documentToCompany(snapshot.data.documents[index]);
                return _buildListItem(context, company);
            }
          );
        });
  }

  Company _documentToCompany(DocumentSnapshot snapshot) {
    return Company(
      name: snapshot['name'],
      location: snapshot['location'],
      image: snapshot['image'],
      description: snapshot['description']
    );
  }

  ListTile _buildListItem(BuildContext context, Company company) {
    return ListTile(
      leading: new CircleAvatar(
        child: new Text(company.name[0]),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompanyWidget(company)),
        );
      },
      title: Text(company.name),
      subtitle: Text(company.location),
    );
  }
}
