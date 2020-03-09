import 'package:flutter/material.dart';
import 'package:hospital_directory/providers/doctors.dart';
import 'package:hospital_directory/providers/panel_routes.dart';
import 'package:provider/provider.dart';

import '../models/doctor.dart';

import '../providers/specialties.dart';
import 'doctor_details_panel.dart';

class DoctorItem extends StatelessWidget {
  const DoctorItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<Doctor>(context, listen: false);
    final specialty = Provider.of<Specialties>(context, listen: false)
        .findById(doctor.specialtyId);

    return Card(
      child: InkWell(
        onTap: () {
          Provider.of<Doctors>(context).setSelectedDoctor(doctor.id);
          Provider.of<PanelRoutes>(context).setPanelToShow(DoctorDetailsPanel.routeName);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 10,
          ),
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
              // borderRadius: BorderRadius.circular(15),
              border: Border.all(
            width: 1,
            color: Theme.of(context).primaryColor,
          )),
        ),
      ),
    );
  }
}
