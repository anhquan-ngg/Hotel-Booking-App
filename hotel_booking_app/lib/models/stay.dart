import 'package:flutter/material.dart';

class StayModel {
  final String type;
  final IconData icon;
  bool isSelected;

  StayModel({
    required this.type,
    required this.icon,
    required this.isSelected,
  });

  static List<StayModel> getStays() {
    List<StayModel> stays = [];

    stays.add(StayModel(
      type: 'Hotel',
      icon: Icons.house,
      isSelected: false,
    ));

    stays.add(StayModel(
      type: 'Homestay',
      icon: Icons.home_outlined,
      isSelected: false,
    ));

    stays.add(StayModel(
      type: 'Apart',
      icon: Icons.apartment,
      isSelected: false,
    ));

    return stays;
  }
}