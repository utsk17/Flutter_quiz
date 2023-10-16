class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);

    shuffledList
        .shuffle(); //here the list is being initialized and stored in a variable
    return shuffledList; // the list is then shuffled using shuffled property of flutter and then stored
  }
}
