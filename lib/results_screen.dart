import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';


class ResultsScreen extends StatelessWidget {
  ResultsScreen({
    super.key,
    required this.choosenAnswers,
    required this.onRestart,
  });
void Function() onRestart;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answers': questions[i].answer[0],
        'choosen_answers': choosenAnswers[i],
      });
    }
    return summary;
  }
  
  @override
  Widget build(BuildContext context) {
      var summaryData =getSummaryData();
      var numberOfAllData=questions.length;
      var numberOfCorrectData=summaryData.where((data){
        return data['correct_answers'] == data['choosen_answers'];
      }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('You Answered $numberOfCorrectData out of $numberOfAllData questions correctly !',
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 191, 119, 182),
                fontSize: 15,
                fontWeight: FontWeight.bold,
            
              ),),
          const SizedBox(height: 30),
          QuestionSummary(summaryData),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(onPressed: onRestart, label: const Text('Reset Quiz'),
          style:TextButton.styleFrom(foregroundColor: Colors.white),icon: const Icon(Icons.refresh_sharp),)
        ]),
      ),
    );
  }
}
