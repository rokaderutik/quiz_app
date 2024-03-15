import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class SingleQuestionModel {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class _QuizAppState extends State<QuizApp> {

  bool questionScreen = true;   //for question screen and congratulation screen
  int questionNo = 0;
  int correctAns = 0;
  int selectedAnswerIndex = -1;   //for selecting options (-1 is by default for no any option selected)

  List<dynamic> allQuestions = const[
    SingleQuestionModel(
      question: "Who is the founder of Microsoft?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 2
    ),
    SingleQuestionModel(
      question: "Who is founder of Amazon?",
      options: ["Steve Jobs", "Jeff Bezos", "Bill Gates", "Elon Musk"],
      answerIndex: 1
    ),
  ];

  MaterialColor checkAnswer(int buttonIndex) {
    if(selectedAnswerIndex != -1) {
      if(buttonIndex == allQuestions[questionNo].answerIndex) {
        return Colors.green;
      } else if (buttonIndex == selectedAnswerIndex) {
        return Colors.red;
      } else {
        return Colors.grey;
      }
    } else {
      return Colors.grey;
    }    
  }

  void validateCurrentPage() {
    if(selectedAnswerIndex == -1) {
      return;
    } else {
      if(selectedAnswerIndex == allQuestions[questionNo].answerIndex) {
        correctAns++;
      }
      if(questionNo == allQuestions.length - 1) {
        setState(() {
          questionScreen = false;
        });
      }
      setState(() {
        questionNo++;
        selectedAnswerIndex = -1;
      });
    }
  } 
  
  Scaffold isQuestionScreen() {
    if(questionScreen == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tech Quiz",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Question: ${questionNo+1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 400,
              height: 50,
              child: Center(
                child: Text(
                  allQuestions[questionNo].question,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w400,
                          
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if(selectedAnswerIndex == -1) {
                    setState((){
                      selectedAnswerIndex = 0;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: checkAnswer(0),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  )
                ),
                child: Text(
                  "A. ${allQuestions[questionNo].options[0]}",
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if(selectedAnswerIndex == -1) {
                    setState((){
                      selectedAnswerIndex = 1;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: checkAnswer(1),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  )
                ),
                child: Text(
                  "B. ${allQuestions[questionNo].options[1]}",
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if(selectedAnswerIndex == -1) {
                    setState((){
                      selectedAnswerIndex = 2;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: checkAnswer(2),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  )
                ),
                child: Text(
                  "C. ${allQuestions[questionNo].options[2]}",
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  if(selectedAnswerIndex == -1) {
                    setState((){
                      selectedAnswerIndex = 3;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: checkAnswer(3),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  )
                ),
                child: Text(
                  "D. ${allQuestions[questionNo].options[3]}",
                  style: const TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            validateCurrentPage();
          },
          backgroundColor: Colors.red,
          child: const Icon(
            Icons.forward,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Tech Quiz",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Image.network(
              "https://img.freepik.com/premium-vector/winner-trophy-cup-with-ribbon-confetti_51486-122.jpg",
              height: 300,
              width: 300,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "$correctAns/${allQuestions.length}",
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const Text(
              "Correct",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            setState((){
              questionScreen = true;
              questionNo = 0;
              correctAns = 0;
              selectedAnswerIndex = -1;
            });
          },
          backgroundColor: Colors.red,
          child: const Text(
            "Reset"
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    return isQuestionScreen();
  }
}
