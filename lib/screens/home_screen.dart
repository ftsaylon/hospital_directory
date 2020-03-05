import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/specialties.dart';

import '../widgets/doctors_panel.dart';
import '../widgets/specialties_panel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var specialtyId = Provider.of<Specialties>(context).specialtyIdToDisplay;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: specialtyId != null
                  ? DoctorsPanel(
                      specialtyId: specialtyId,
                    )
                  : SpecialtiesPanel(),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                  child: const Text('Ad Space'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
