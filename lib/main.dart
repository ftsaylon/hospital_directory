import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/panel_routes.dart';
import 'providers/doctors.dart';
import 'providers/specialties.dart';

import 'widgets/specialties_panel.dart';
import 'widgets/doctors_panel.dart';

import 'screens/home_screen.dart';

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
        ),
        ChangeNotifierProvider.value(
          value: PanelRoutes(),
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
        home: HomeScreen(),
        routes: {
          SpecialtiesPanel.routeName: (context) => SpecialtiesPanel(),
          DoctorsPanel.routeName: (context) => DoctorsPanel(),
        },
      ),
    );
  }
}
