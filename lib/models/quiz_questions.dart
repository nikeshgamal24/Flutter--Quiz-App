class QuizQuestion{
  const QuizQuestion(this.text, this.answers);

  final String text;
  final List<String> answers;

  //creating a method to shuffle the list as shuffle will change the original list we dont directly shuffle the list but we copy the list and shuffle the copied list and return the shuffled list to display the option 

  List<String> getShuffledAnswer(){
      final shuffledList = List.of(answers);
      shuffledList.shuffle();
      return shuffledList;
  }
}