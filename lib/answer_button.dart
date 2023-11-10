import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({
    super.key,
    required this.text,
    required this.onTab,
  });
  String text;
  void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTab,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 118, 2, 139),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Text(text, textAlign: TextAlign.center));
  }
}
