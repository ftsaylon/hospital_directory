import 'package:flutter/material.dart';

class Specialty extends ChangeNotifier{
  final String id;
  final String name;

  Specialty({
    @required this.id,
    @required this.name,
  });
}
