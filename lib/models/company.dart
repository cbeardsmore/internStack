import 'package:cloud_firestore/cloud_firestore.dart';

class Company {
  final String name;
  final String location;
  final String image;
  final String logo;
  final String applyLink;
  final String industry;

  const Company(
      {this.name,
      this.location,
      this.image,
      this.logo,
      this.applyLink,
      this.industry});

  Company.fromDocument(DocumentSnapshot snapshot)
      : name = snapshot['name'],
        location = snapshot['location'],
        image = snapshot['image'],
        logo = snapshot['logo'],
        applyLink = snapshot['apply_link'],
        industry = snapshot['industry'];
}
