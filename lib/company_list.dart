import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'company.dart';
import 'company_widget.dart';

const companies = const <Company>[
  const Company(
      name: 'Atlassian',
      location: 'Sydney',
      image: 'assets/atlassian.webp',
      description:
          'Atlassian Corporation Plc is an Australian enterprise software company that develops products'),
  const Company(
      name: 'Optiver',
      location: 'Sydney',
      image: 'assets/atlassian.webp',
      description: 'Optiver description...'),
  const Company(
      name: 'VGW',
      location: 'Perth',
      image: 'assets/atlassian.webp',
      description: 'VGW description...'),
  const Company(
      name: 'Woodside',
      location: 'Perth',
      image: 'assets/atlassian.webp',
      description: 'Woodside description...'),
];

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
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data.documents[index]),
          );
        });
  }

  ListTile _buildListItem(BuildContext context, DocumentSnapshot company) {
    return ListTile(
      leading: new CircleAvatar(
        child: new Text(company['name'][0]),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CompanyWidget(company)),
        );
      },
      title: Text(company['name']),
      subtitle: Text(company['location']),
    );
  }
}
