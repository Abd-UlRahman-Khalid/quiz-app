class QuizQuestion{
  const QuizQuestion (this.text,this.answer);
  final String text;
  final List<String> answer;

  List<String> getShuffuledAnswers(){
    final shuffuledList=List.of(answer);
    shuffuledList.shuffle();
    return shuffuledList;
  }
}