// ignore_for_file: must_be_immutable

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String name;
  final bool completed;
  Function(bool?)? onChanged;
  Function()? deleteFn;

  ToDoTile(
      {super.key,
      required this.name,
      required this.completed,
      required this.onChanged,
      required this.deleteFn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, left: 10, right: 10),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white60, Colors.white10]),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: completed,
                      onChanged: onChanged,
                      activeColor: Colors.black,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: deleteFn,
                  child: const Icon(
                    Icons.delete_forever,
                    size: 28,
                    color: Colors.amber,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
