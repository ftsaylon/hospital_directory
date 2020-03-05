import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/specialties.dart';

import '../widgets/specialty_item.dart';

class SpecialtiesPanel extends StatelessWidget {
  const SpecialtiesPanel({Key key}) : super(key: key);

  static const routeName = '/specialties';

  @override
  Widget build(BuildContext context) {
    final specialtiesData = Provider.of<Specialties>(context);
    final specialties = specialtiesData.items;

    return Container(
      padding: const EdgeInsets.all(8.0),
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
    );
  }
}
