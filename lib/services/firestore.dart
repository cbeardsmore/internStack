import 'package:cloud_firestore/cloud_firestore.dart';

const String COLLECTION_CLOSING_DATE = "closing_dates";

void saveClosingDate(String companyName, DateTime closingDate) {
  Firestore.instance
      .collection(COLLECTION_CLOSING_DATE)
      .add({'company': companyName, 'closing_date': closingDate});
}
