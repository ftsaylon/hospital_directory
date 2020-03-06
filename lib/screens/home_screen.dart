import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/specialties.dart';
import '../providers/doctors.dart';

import '../widgets/ad_space.dart';
import '../widgets/doctors_panel.dart';
import '../widgets/specialties_panel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final specialtyId = Provider.of<Specialties>(context).specialtyIdToDisplay;
    final showAllDoctors = Provider.of<Doctors>(context).showAllDoctors;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('HOSPITAL DIRECTORY')),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: (specialtyId != null || showAllDoctors)
                  ? DoctorsPanel(
                      specialtyId: specialtyId,
                    )
                  : SpecialtiesPanel(),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: const AdSpace(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
