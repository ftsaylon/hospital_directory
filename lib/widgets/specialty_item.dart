import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/specialty.dart';

import '../screens/doctors_screen.dart';

class SpecialtyItem extends StatelessWidget {
  const SpecialtyItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final specialty = Provider.of<Specialty>(context, listen: false);

    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            DoctorsScreen.routeName,
            arguments: specialty.id,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            specialty.name,
            style: Theme.of(context).textTheme.title,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
