import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/specialties.dart';

import '../widgets/ad_space.dart';
import '../widgets/doctors_panel.dart';
import '../widgets/specialties_panel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var specialtyId = Provider.of<Specialties>(context).specialtyIdToDisplay;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            specialtyId != null
                ? IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Provider.of<Specialties>(context)
                          .setSpecialtyToDisplay(null);
                    },
                  )
                : Container(),
          ],
        ),
      ),
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
                  child: const AdSpace(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
