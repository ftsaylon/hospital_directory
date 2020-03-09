import 'package:flutter/material.dart';

class PanelRoutes extends ChangeNotifier {
  String _panelToShow;

  Future<void> setPanelToShow(String routeName) async {
    _panelToShow = routeName;
    notifyListeners();
  }

  String get panelToShow{
    return _panelToShow;
  }
  
}