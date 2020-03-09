import 'package:flutter/material.dart';
import 'package:hospital_directory/providers/panel_routes.dart';

import 'package:provider/provider.dart';

import '../providers/specialties.dart';
import '../providers/doctors.dart';

import '../widgets/ad_space.dart';
import '../widgets/doctors_panel.dart';
import '../widgets/specialties_panel.dart';
import '../widgets/doctor_details_panel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final specialtyId = Provider.of<Specialties>(context).selectedSpecialty;
    final doctorId = Provider.of<Doctors>(context).selectedDoctor;

    final panelToShow = Provider.of<PanelRoutes>(context).panelToShow ??
        SpecialtiesPanel.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('HOSPITAL DIRECTORY')),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            if (panelToShow == DoctorsPanel.routeName)
              Expanded(
                flex: 5,
                child: DoctorsPanel(
                  specialtyId: specialtyId,
                ),
              ),
            if (panelToShow == SpecialtiesPanel.routeName)
              Expanded(
                flex: 5,
                child: SpecialtiesPanel(),
              ),
            if (panelToShow == DoctorDetailsPanel.routeName)
              Expanded(
                flex: 5,
                child: DoctorDetailsPanel(
                  doctorId: doctorId,
                ),
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
