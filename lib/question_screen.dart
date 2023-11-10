import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key,required this.onsSelectedAnswer});
  final void Function(String answer) onsSelectedAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentIndex=0;
  void answerQuestion(String selectedAnswers){
    widget.onsSelectedAnswer(selectedAnswers);

    setState(() {
      currentIndex++;
    });
  }
  @override
  Widget build(context) {
    final currentQuestion = questions[currentIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 191, 119, 182),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
          ...currentQuestion.getShuffuledAnswers().map((answer){
            return AnswerButton(text: answer, onTab: (){
              answerQuestion(answer);
            });
          })
          ],
        ),
      ),
    );
  }
}
