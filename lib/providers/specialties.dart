import 'package:flutter/material.dart';

import '../models/specialty.dart';

class Specialties with ChangeNotifier {
  List<Specialty> _items = [
    Specialty(id: 's1', name: 'Allergy & Immunology'),
    Specialty(id: 's2', name: 'Anesthesiology'),
    Specialty(id: 's3', name: 'Colon & Rectal Surgery'),
    Specialty(id: 's4', name: 'Dermatology'),
    Specialty(id: 's5', name: 'Emergency Medicine'),
    Specialty(id: 's6', name: 'Family Medicine'),
    Specialty(id: 's7', name: 'Internal Medicine'),
    Specialty(id: 's8', name: 'Medical Genetics and Genomics'),
    Specialty(id: 's9', name: 'Neurological Surgery'),
    Specialty(id: 's10', name: 'Nuclear Medicine'),
    Specialty(id: 's11', name: 'Obsterics & Gynecology'),
    Specialty(id: 's12', name: 'Ophtalmology'),
    Specialty(id: 's13', name: 'Orthopaedic Surgery'),
    Specialty(id: 's14', name: 'Otolaryngology - Head and Neck Surgery'),
    Specialty(id: 's15', name: 'Pathology'),
    Specialty(id: 's16', name: 'Pediatrics'),
    Specialty(id: 's17', name: 'Physical Medicine & Rehabilitation'),
    Specialty(id: 's18', name: 'Plastic Surgery'),
    Specialty(id: 's19', name: 'Preventive Medicine'),
    Specialty(id: 's20', name: 'Psychiatry & Neurology'),
    Specialty(id: 's21', name: 'Radiology'),
    Specialty(id: 's22', name: 'Surgery'),
    Specialty(id: 's23', name: 'Thoracic Surgery'),
    Specialty(id: 's24', name: 'Urology'),
  ];

  String specialtyIdToDisplay;

  Future<void> setSpecialtyToDisplay(String specialtyId) async {
    specialtyIdToDisplay = specialtyId;
    notifyListeners();
  }

  List<Specialty> get items {
    return [..._items];
  }

  Specialty findById(String id) {
    Specialty specialty;
    if (id != null) {
      specialty = _items.firstWhere((item) => item.id == id);
    }
    return specialty;
  }
}
