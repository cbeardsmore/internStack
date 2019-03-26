import 'package:flutter/material.dart';
import 'status_enum.dart';

class Status {
  StatusEnum status;

  final Map colorMap = Map.from({
    StatusEnum.OPEN: Colors.lightGreenAccent[400],
    StatusEnum.CLOSED: Colors.redAccent[400],
    StatusEnum.CLOSING_SOON: Colors.amber[900]
  });

  Status(DateTime closingDate, bool isOpen) {
    if (isOpen)
      status = StatusEnum.OPEN;
    else if ((closingDate == null) || (closingDate.isBefore(DateTime.now())))
      status = StatusEnum.CLOSED;
    else if (closingDate.difference(DateTime.now()).inDays < 7)
      status = StatusEnum.CLOSING_SOON;
    else
      status = StatusEnum.OPEN;
  }

  getName() {
    return status.toString().split('.').last.replaceAll('_', ' ');
  }

  getColor() {
    return colorMap[status];
  }
}
