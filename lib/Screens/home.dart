import 'package:flutter/material.dart';
import 'package:questions/Models/question.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  bool result = false;
  int score = 0;
  int selectedCorrect = -1;
  bool last = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            children: [
              const Text(
                'Simple Quiz App',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    'Question ${index + 1} / ${questions.length}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    'Score $score / ${questions.length}',
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    padding: const EdgeInsets.all(50),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Text(
                      questions[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Positioned(
                    left: -25,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  const Positioned(
                    right: -25,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                    ),
                  ),
                  const Positioned(
                    top: -25,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.check),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ...List.generate(questions[index].answers.length, (i) {
                return answerButton(questions[index].answers[i], i);
              }),
              MaterialButton(
                onPressed: nextQuestion,
                height: 40,
                minWidth: 300,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextQuestion() {
    setState(() {
      // Update score if the selected answer is correct
      if (questions[index].answers[selectedCorrect].isCorrect && result) {
        score++;
      }

      // Check if the current question is the last one
      if (index < questions.length - 1) {
        index++;
        selectedCorrect = -1; // Reset selected answer
        result = false;
      } else if (index == questions.length - 1 && !last) {
        // For the last question, show the result dialog with the final score
        showResultDialog();
        last = true;
      }
    });
  }

  void showResultDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            60 < (score / questions.length) * 100
                ? 'Passed $score / ${questions.length}'
                : 'Failed $score / ${questions.length}',
            style: TextStyle(
                color: 60 < (score / questions.length) * 100
                    ? Colors.green
                    : Colors.red),
          ),
          content: ElevatedButton(
            onPressed: () {
              resetQuiz();
              Navigator.of(context).pop();
            },
            child: const Text("Reset"),
          ),
        );
      },
    );
  }

  void resetQuiz() {
    setState(() {
      index = 0;
      result = false;
      score = 0;
      selectedCorrect = -1;
      last = false;
    });
  }

  Widget answerButton(Answer answer, int i) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: MaterialButton(
          onPressed: () {
            setState(() {
              selectedCorrect = i;
              result = answer.isCorrect;
            });
          },
          height: 40,
          minWidth: 200,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: selectedCorrect == i && result ? Colors.orange : Colors.white,
          child: Text(
            answer.title,
            style: const TextStyle(
              color: Colors.black,
            ),
          )),
    );
  }
}