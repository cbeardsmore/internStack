import 'package:flutter/material.dart';

enum Status { OPEN, CLOSED, CLOSING_SOON }

Map statusColorMap = Map.from({
  Status.OPEN: Colors.lightGreenAccent[400],
  Status.CLOSED: Colors.redAccent[400],
  Status.CLOSING_SOON: Colors.amber[900]
});

String getStatusName(Status status) {
  return status.toString().split('.').last.replaceAll('_', ' ');
}

Color getStatusColor(Status status) {
  return statusColorMap[status];
}
