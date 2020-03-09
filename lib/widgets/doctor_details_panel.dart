import 'package:flutter/material.dart';
import 'package:hospital_directory/providers/doctors.dart';
import 'package:hospital_directory/providers/specialties.dart';
import 'package:provider/provider.dart';

class DoctorDetailsPanel extends StatelessWidget {
  final String doctorId;

  const DoctorDetailsPanel({Key key, this.doctorId}) : super(key: key);
  
  static const routeName = '/doctor-details';

  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<Doctors>(context).findById(doctorId);
    final specialty =
        Provider.of<Specialties>(context).findById(doctor.specialtyId);

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(flex: 1, child: Container()),
          Expanded(
            flex: 1,
            child: RaisedButton(
              child: Text(
                'Back to Doctors',
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<Doctors>(context).setSelectedDoctor(null);
              },
              color: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Dr. ${doctor.firstName} ${doctor.middleName} ${doctor.lastName}',
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(fontSize: 36),
                        ),
                        Text(
                          specialty.name,
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontSize: 24),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Email Address: ${doctor.emailAddress}',
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontSize: 20),
                        ),
                        Text(
                          'Contact Number: ${doctor.contactNumber}',
                          style: Theme.of(context)
                              .textTheme
                              .subhead
                              .copyWith(fontSize: 20),
                        ),
                        Image.network(
                          'https://store-images.s-microsoft.com/image/apps.33967.13510798887182917.246b0a3d-c3cc-46fc-9cea-021069d15c09.392bf5f5-ade4-4b36-aa63-bb15d5c3817a',
                          height: 180,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Image.network(doctor.imageUrl),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Text(
              'Schedule',
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 24),
            ),
          )
        ],
      ),
    );
  }
}
