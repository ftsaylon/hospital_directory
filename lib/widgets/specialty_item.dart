import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/specialty.dart';

import '../providers/specialties.dart';

class SpecialtyItem extends StatelessWidget {
  const SpecialtyItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final specialty = Provider.of<Specialty>(context, listen: false);

    return Card(
      child: InkWell(
        onTap: () {
          Provider.of<Specialties>(context).setSpecialtyToDisplay(specialty.id);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Text(
            specialty.name,
            style: Theme.of(context).textTheme.title,
          ),
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(15),
              border: Border.all(
            color: Theme.of(context).primaryColor,
          )),
        ),
      ),
    );
  }
}
