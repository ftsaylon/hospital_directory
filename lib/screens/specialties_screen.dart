import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/specialties.dart';

import '../widgets/specialty_item.dart';

class SpecialtiesScreen extends StatelessWidget {
  const SpecialtiesScreen({Key key}) : super(key: key);

  static const routeName = '/specialties';

  @override
  Widget build(BuildContext context) {
    final specialtiesData = Provider.of<Specialties>(context);
    final specialties = specialtiesData.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Specialties'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: specialties.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: specialties[index],
            child: SpecialtyItem(),
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
