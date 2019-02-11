import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'models/company.dart';
import 'company_widget.dart';
import 'widgets/curver_corner_card.dart';

class CompanyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  StreamBuilder _buildList(BuildContext context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('companies')
            .orderBy('name')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                Company company =
                    Company.fromDocument(snapshot.data.documents[index]);
                return _oldbuildListItem(context, company);
              });
        });
  }

  GestureDetector _oldbuildListItem(BuildContext context, Company company) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CompanyWidget(company)),
          );
        },
        child: CurverCornerCard(
            child: Row(children: <Widget>[
          _cardImage(company),
          Expanded(child: _cardText(context, company))
        ])));
  }

  SizedBox _cardImage(Company company) {
    return SizedBox(
        child: CachedNetworkImage(
            imageUrl: company.logo + 'sss',
            placeholder:
                Image.asset('assets/company_default.jpg', fit: BoxFit.cover),
            errorWidget:
                Image.asset('assets/company_default.jpg', fit: BoxFit.cover),
            fit: BoxFit.fitHeight),
        height: 100.0,
        width: 100.0);
  }

  Column _cardText(BuildContext context, Company company) {
    return Column(
      children: <Widget>[
        Text(company.name,
            style: Theme.of(context).textTheme.display1,
            textAlign: TextAlign.center),
        Text(company.location,
            style: Theme.of(context).textTheme.display2,
            textAlign: TextAlign.center)
      ],
    );
  }
}
