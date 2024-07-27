class Answer {
  String title;
  bool isCorrect;

  Answer({required this.title, required this.isCorrect});
}

class Question {
  String title;
  List<Answer> answers;

  Question({required this.title, required this.answers});
}

List<Question> questions = [
  Question(title: "What is the capital of Egypt?",
   answers: [
    Answer(title: "Cairo", isCorrect: true),
    Answer(title: "Fayoum", isCorrect: false),
    Answer(title: "Alexandria", isCorrect: false),
  ]),
  Question(title: "What is the capital of France?", answers: [
    Answer(title: "Paris", isCorrect: true),
    Answer(title: "Lyon", isCorrect: false),
    Answer(title: "Marseille", isCorrect: false),
  ]),
  Question(title: "What is the capital of Japan?", answers: [
    Answer(title: "Tokyo", isCorrect: true),
    Answer(title: "Osaka", isCorrect: false),
    Answer(title: "Kyoto", isCorrect: false),
  ]),
  Question(title: "What is the capital of Canada?", answers: [
    Answer(title: "Ottawa", isCorrect: true),
    Answer(title: "Toronto", isCorrect: false),
    Answer(title: "Vancouver", isCorrect: false),
  ]),
  Question(title: "What is the capital of Australia?", answers: [
    Answer(title: "Canberra", isCorrect: true),
    Answer(title: "Sydney", isCorrect: false),
    Answer(title: "Melbourne", isCorrect: false),
  ]),
  Question(title: "What is the capital of Italy?", answers: [
    Answer(title: "Rome", isCorrect: true),
    Answer(title: "Milan", isCorrect: false),
    Answer(title: "Florence", isCorrect: false),
  ]),
  Question(title: "What is the capital of Germany?", answers: [
    Answer(title: "Berlin", isCorrect: true),
    Answer(title: "Munich", isCorrect: false),
    Answer(title: "Frankfurt", isCorrect: false),
  ]),
  Question(title: "What is the capital of Brazil?", answers: [
    Answer(title: "Brasilia", isCorrect: true),
    Answer(title: "Rio de Janeiro", isCorrect: false),
    Answer(title: "Sao Paulo", isCorrect: false),
  ]),
  Question(title: "What is the capital of Russia?", answers: [
    Answer(title: "Moscow", isCorrect: true),
    Answer(title: "Saint Petersburg", isCorrect: false),
    Answer(title: "Novosibirsk", isCorrect: false),
  ]),
  Question(title: "What is the capital of India?", answers: [
    Answer(title: "New Delhi", isCorrect: true),
    Answer(title: "Mumbai", isCorrect: false),
    Answer(title: "Bangalore", isCorrect: false),
  ]),
];
