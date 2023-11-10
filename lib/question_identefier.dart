import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget {
  const QuestionIdentifier(
      {super.key, required this.questionIndex, required this.isCorrect});
  final int questionIndex;
  final bool isCorrect;

  @override
  Widget build(BuildContext context) {
    final questionIndexNo=questionIndex+1;
    return Container(
      width: 30,
      height:30,
      decoration: BoxDecoration(
          color: isCorrect
              ? const Color.fromARGB(255, 88, 168, 234)
              : const Color.fromARGB(255, 236, 87, 187),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Text(
          questionIndexNo.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
