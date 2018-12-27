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
                Company company =
                    _documentToCompany(snapshot.data.documents[index]);
                return _buildListItem(context, company);
              });
        });
  }

  Company _documentToCompany(DocumentSnapshot snapshot) {
    return Company(
        name: snapshot['name'],
        location: snapshot['location'],
        image: snapshot['image'],
        logo: snapshot['logo'],
        description: snapshot['description']);
  }

  Card _buildListItem(BuildContext context, Company company) {
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
