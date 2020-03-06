import 'package:flutter/material.dart';

import '../models/doctor.dart';

class Doctors with ChangeNotifier {
  List<Doctor> _items = [
    Doctor(
      id: '1',
      firstName: "Terese",
      middleName: "Semon",
      lastName: "Faireclough",
      specialtyId: 's1',
      contactNumber: "09399059794",
      emailAddress: "tfaireclough0@moonfruit.com",
      distinction: "MD",
    ),
    Doctor(
      id: '2',
      firstName: "Debera",
      middleName: "Martynikhin",
      lastName: "Brewett",
      specialtyId: 's1',
      contactNumber: "09399059794",
      emailAddress: "dbrewett1@buzzfeed.com",
      distinction: "MD",
    ),
    Doctor(
      id: '3',
      firstName: "Harri",
      middleName: "Mellsop",
      lastName: "MacClay",
      specialtyId: 's1',
      contactNumber: "09399059794",
      emailAddress: "hmacclay2@g.co",
      distinction: "MD",
    ),
    Doctor(
      id: '4',
      firstName: "Penn",
      middleName: "Sadry",
      lastName: "Guice",
      specialtyId: 's2',
      contactNumber: "09399059794",
      emailAddress: "pguice3@flickr.com",
      distinction: "MD",
    ),
    Doctor(
      id: '5',
      firstName: "Mead",
      middleName: "Pearmain",
      lastName: "Barfford",
      specialtyId: 's2',
      contactNumber: "09399059794",
      emailAddress: "mbarfford4@va.gov",
      distinction: "MD",
    ),
    Doctor(
      id: '6',
      firstName: "Kial",
      middleName: "Lombardo",
      lastName: "Nicklin",
      specialtyId: 's2',
      contactNumber: "09399059794",
      emailAddress: "knicklin5@usa.gov",
      distinction: "MD",
    ),
    Doctor(
      id: '7',
      firstName: "Ricki",
      middleName: "Norgan",
      lastName: "Jiranek",
      specialtyId: 's3',
      contactNumber: "09399059794",
      emailAddress: "rjiranek6@baidu.com",
      distinction: "MD",
    ),
    Doctor(
      id: '8',
      firstName: "Neville",
      middleName: "Trubshaw",
      lastName: "Daveren",
      specialtyId: 's3',
      contactNumber: "09399059794",
      emailAddress: "ndaveren7@ox.ac.uk",
      distinction: "MD",
    ),
    Doctor(
      id: '9',
      firstName: "Padraic",
      middleName: "Battany",
      lastName: "Lascelles",
      specialtyId: 's3',
      contactNumber: "09399059794",
      emailAddress: "plascelles8@answers.com",
      distinction: "MD",
    ),
    Doctor(
      id: '10',
      firstName: "Jolee",
      middleName: "Forstall",
      lastName: "Girvin",
      specialtyId: 's4',
      contactNumber: "09399059794",
      emailAddress: "jgirvin9@booking.com",
      distinction: "MD",
    ),
    Doctor(
      id: '11',
      firstName: "Rudolfo",
      middleName: "Wrassell",
      lastName: "Dickie",
      specialtyId: 's4',
      contactNumber: "09399059794",
      emailAddress: "rdickiea@home.pl",
      distinction: "MD",
    ),
    Doctor(
      id: '12',
      firstName: "Regina",
      middleName: "Craig",
      lastName: "Paal",
      specialtyId: 's4',
      contactNumber: "09399059794",
      emailAddress: "rpaalb@reverbnation.com",
      distinction: "MD",
    ),
    Doctor(
      id: '13',
      firstName: "Alessandra",
      middleName: "Crippill",
      lastName: "Eseler",
      specialtyId: 's5',
      contactNumber: "09399059794",
      emailAddress: "aeselerc@paginegialle.it",
      distinction: "MD",
    ),
    Doctor(
      id: '14',
      firstName: "Harley",
      middleName: "Maynard",
      lastName: "Blackadder",
      specialtyId: 's5',
      contactNumber: "09399059794",
      emailAddress: "hblackadderd@4shared.com",
      distinction: "MD",
    ),
    Doctor(
      id: '15',
      firstName: "Serena",
      middleName: "Danat",
      lastName: "Heatley",
      specialtyId: 's5',
      contactNumber: "09399059794",
      emailAddress: "sheatleye@tripod.com",
      distinction: "MD",
    ),
  ];

  bool _showAllDoctors = false;

  List<Doctor> get items {
    return [..._items];
  }

  List<Doctor> findBySpecialty(String specialtyId) {
    return _items.where((item) => item.specialtyId == specialtyId).toList();
  }

  bool get showAllDoctors{
    return _showAllDoctors;
  }

  Future<void> toggleShowAllDoctors() async {
    _showAllDoctors = !_showAllDoctors;
  }
}
