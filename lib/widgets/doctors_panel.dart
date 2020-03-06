import 'package:flutter/material.dart';
import 'package:hospital_directory/providers/specialties.dart';
import 'package:provider/provider.dart';

import '../providers/doctors.dart';

import '../widgets/doctor_item.dart';

class DoctorsPanel extends StatelessWidget {
  final String specialtyId;

  const DoctorsPanel({Key key, this.specialtyId}) : super(key: key);

  static const routeName = '/doctors';

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = MediaQuery.of(context);
    // final PreferredSizeWidget appBar = AppBar();

    final doctorsData = Provider.of<Doctors>(context);
    final doctors = specialtyId != null
        ? doctorsData.findBySpecialty(specialtyId)
        : doctorsData.items;

    final specialty = Provider.of<Specialties>(context).findById(specialtyId);

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: specialtyId != null
                ? Text(
                    'Doctors in ${specialty.name}',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 36),
                  )
                : Text(
                    'All Doctors',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 36),
                  ),
          ),
          Expanded(
            flex: 1,
            child: RaisedButton(
              child: Text(
                'Back to Specialties',
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<Specialties>(context).setSpecialtyToDisplay(null);
                if(specialtyId == null) Provider.of<Doctors>(context).toggleShowAllDoctors();
              },
              color: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            flex: 14,
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
          ),
        ],
      ),
    );
  }
}
