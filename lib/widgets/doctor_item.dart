import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/doctor.dart';

import '../providers/specialties.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<Doctor>(context, listen: false);
    final specialty = Provider.of<Specialties>(context, listen: false).findById(doctor.specialtyId);

    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Dr. ${doctor.firstName} ${doctor.lastName}, ${doctor.distinction}',
                style: Theme.of(context).textTheme.title,
              ),
              Text('${specialty.name}'),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}