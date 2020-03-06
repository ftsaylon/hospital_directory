import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/specialties.dart';
import '../providers/doctors.dart';

import '../widgets/specialty_item.dart';

class SpecialtiesPanel extends StatelessWidget {
  const SpecialtiesPanel({Key key}) : super(key: key);

  static const routeName = '/specialties';

  @override
  Widget build(BuildContext context) {
    final specialtiesData = Provider.of<Specialties>(context);
    final specialties = specialtiesData.items;

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              'Medical Specialties',
              style: Theme.of(context).textTheme.title.copyWith(fontSize: 36),
            ),
          ),
          Expanded(
            flex: 1,
            child: RaisedButton(
              child: Text(
                'Show All Doctors',
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.white),
              ),
              onPressed: () {
                Provider.of<Specialties>(context).setSpecialtyToDisplay(null);
                Provider.of<Doctors>(context).toggleShowAllDoctors();
              },
              color: Theme.of(context).primaryColor,
            ),
          ),
          Expanded(
            flex: 14,
            child: GridView.builder(
              itemCount: specialties.length,
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: specialties[index],
                child: SpecialtyItem(),
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
