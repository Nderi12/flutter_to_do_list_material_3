import 'package:flutter/material.dart';
import 'package:to_do_app/util/text_form_field_widget.dart';
import 'package:to_do_app/util/button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  DialogBox({super.key, required this.onSave, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber.withOpacity(.8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      alignment: Alignment.center,
      actions: [
        Column(
          children: [
            const SizedBox(height: 20),
            const Center(
                child: Text(
              'Add New Task',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: TextFormFieldWidget(
                  title: 'Title',
                  controller: controller,
                  prefixIcon: Icons.task,
                  keyBoardType: TextInputType.text),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(title: 'Save', color: Colors.teal, onPressed: onSave),
                MyButton(
                    title: 'Cancel',
                    color: Colors.red,
                    onPressed: () => Navigator.pop(context))
              ],
            ),
          ],
        ),
      ],
    );
    ;
  }
}
