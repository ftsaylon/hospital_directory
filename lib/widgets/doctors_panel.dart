import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/doctors.dart';

import '../widgets/doctor_item.dart';

class DoctorsPanel extends StatelessWidget {
  final String specialtyId;

  const DoctorsPanel({Key key, this.specialtyId}) : super(key: key);

  static const routeName = '/doctors';

  @override
  Widget build(BuildContext context) {
    final doctorsData = Provider.of<Doctors>(context);
    final doctors = specialtyId != 's0'
        ? doctorsData.findBySpecialty(specialtyId)
        : doctorsData.items;

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: doctors.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: doctors[index],
          child: DoctorItem(),
        ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
