import 'package:flutter/material.dart';
import '../models/schedule.dart';

class Doctor extends ChangeNotifier {
  final String id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String specialtyId;
  final String contactNumber;
  final String emailAddress;
  final String distinction;
  final String imageUrl;
  final Schedule schedule;
  bool isOnPremise;

  Doctor({
    @required this.id,
    @required this.firstName,
    @required this.middleName,
    @required this.lastName,
    @required this.specialtyId,
    @required this.contactNumber,
    @required this.emailAddress,
    @required this.distinction,
    this.imageUrl,
    this.schedule,
    this.isOnPremise = false,
  });
}
