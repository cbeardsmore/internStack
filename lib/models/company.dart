import 'package:cloud_firestore/cloud_firestore.dart';

class Company {
  final String name;
  final String location;
  final String image;
  final String logo;
  final String applyLink;
  final String industry;
  final String founded;
  final DateTime closingDate;
  final bool isOpen;

  const Company(
      {this.name,
      this.location,
      this.image,
      this.logo,
      this.applyLink,
      this.industry,
      this.founded,
      this.closingDate,
      this.isOpen});

  Company.fromDocument(DocumentSnapshot snapshot)
      : name = snapshot['name'],
        location = snapshot['location'],
        image = snapshot['image'],
        logo = snapshot['logo'],
        applyLink = snapshot['apply_link'],
        industry = snapshot['industry'],
        founded = snapshot['founded'],
        closingDate = snapshot['closing_date'],
        isOpen = snapshot['open'] ?? false;
}
