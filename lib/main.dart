import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/doctors.dart';
import 'providers/specialties.dart';

import 'screens/specialties_screen.dart';
import 'screens/doctors_screen.dart';

import 'helpers/custom_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Specialties(),
        ),
        ChangeNotifierProvider.value(
          value: Doctors(),
        )
      ],
      child: MaterialApp(
        title: 'Hospital Directory',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.pinkAccent,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CustomPageTransitionBuilder(),
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
            },
          ),
        ),
        home: SpecialtiesScreen(),
        routes: {
          SpecialtiesScreen.routeName: (context) => SpecialtiesScreen(),
          DoctorsScreen.routeName: (context) => DoctorsScreen(),
        },
      ),
    );
  }
}
