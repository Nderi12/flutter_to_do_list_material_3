import 'package:flutter/material.dart';

class UtilityClass {
  List tasks = [
    // {'name': 'Shopping', 'completed': true},
    // {'name': 'Hitting the gym', 'completed': false},
    // {'name': 'Lunch with Mum', 'completed': true},
    // {'name': 'Group meeting', 'completed': false},
    // {'name': 'Draft client proposal', 'completed': false},
    // {'name': 'Quick team recap', 'completed': true},
    // {'name': 'New app features review', 'completed': false},
    // {'name': 'Read weekly book', 'completed': false},
    // {'name': 'Grab lunch with Alex', 'completed': true},
    // {'name': 'Do laundry', 'completed': true},
  ];

  static textFormDecoration(
      BuildContext context, String labelText, IconData prefixIcon) {
    final decoration = InputDecoration(
      prefixIcon: Icon(
        prefixIcon,
        size: 18,
        color: Colors.white,
      ),
      iconColor: Colors.white,
      labelText: labelText,
      labelStyle: const TextStyle(color: Colors.white, fontSize: 12),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.0),
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        gapPadding: 10,
        borderSide: BorderSide(
          color: Colors.white.withOpacity(.2),
          width: 2.0,
        ),
      ),
    );

    return decoration;
  }
}
