import 'package:cloud_firestore/cloud_firestore.dart';

const String COLLECTION_COMPANY = "companies";
const String COLLECTION_CLOSING_DATE = "closing_dates";
const String COLLECTION_SUBMISSION = "submissions";

Stream<QuerySnapshot> getCompanySnapshots() {
  return Firestore.instance
      .collection(COLLECTION_COMPANY)
      .orderBy('name')
      .snapshots();
}

void saveSubmission(Map json) {
  Firestore.instance.collection(COLLECTION_SUBMISSION).add(json);
}

void saveClosingDate(String companyName, DateTime closingDate) {
  Firestore.instance
      .collection(COLLECTION_CLOSING_DATE)
      .add({'company': companyName, 'closing_date': closingDate});
}
