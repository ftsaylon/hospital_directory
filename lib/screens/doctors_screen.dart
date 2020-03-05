import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/doctors.dart';

import '../widgets/doctor_item.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({Key key}) : super(key: key);

  static const routeName = '/doctors';
  
  @override
  Widget build(BuildContext context) {
    final specialtyId = ModalRoute.of(context).settings.arguments as String;
    final doctorsData = Provider.of<Doctors>(context);
    final doctors = specialtyId != 's0' ? doctorsData.findBySpecialty(specialtyId) : doctorsData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: doctors[index],
            child: DoctorItem(),
          ),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/ 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ),
    );
  }
}
