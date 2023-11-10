import 'package:flutter/material.dart';
import 'package:quiz_app/data.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});
  List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Data(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
