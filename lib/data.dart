import 'package:flutter/material.dart';
import 'package:quiz_app/question_identefier.dart';
import 'package:google_fonts/google_fonts.dart';

class Data extends StatelessWidget{
  const Data (this.data,{super.key});
  final Map<String,Object>data;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        data['choosen_answers'] == data['correct_answers'];
    return Row(
      crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              QuestionIdentifier(questionIndex: data['question_index']as int, isCorrect: isCorrectAnswer),
              
              Expanded(
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      data['question'] as String,
                      style: GoogleFonts.lato(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      data['choosen_answers'] as String,
                      style: GoogleFonts.lato(
                        color: const Color.fromARGB(255, 191, 119, 182),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(data['correct_answers'] as String,style: GoogleFonts.lato(
                        color: Color.fromARGB(255, 133, 171, 210),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),),
                  ],
                ),
              ),
            ],
          );
  }
  
}