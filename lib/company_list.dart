import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'models/company.dart';
import 'models/status.dart';
import 'company_widget.dart';
import 'widgets/curver_corner_card.dart';
import 'services/notifications.dart';
import 'services/firestore.dart';

class CompanyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initialiseNotifications();
    return _buildList(context);
  }

  StreamBuilder _buildList(BuildContext context) {
    return StreamBuilder(
        stream: getCompanySnapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
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
    Status status = Status(company.closingDate, company.isOpen);
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CompanyWidget(company)),
          );
        },
        child: CurverCornerCard(
            child: Stack(children: <Widget>[
          Row(children: <Widget>[
            _cardImage(company),
            Expanded(child: _cardText(context, company))
          ]),
          Container(
              height: 10,
              alignment: AlignmentDirectional(1.05, 0),
              child: Chip(
                label: Text('  '),
                backgroundColor: status.getColor(),
                shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6.0))),
              ))
        ])));
  }

  SizedBox _cardImage(Company company) {
    return SizedBox(
        child: CachedNetworkImage(
            imageUrl: company.logo,
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
