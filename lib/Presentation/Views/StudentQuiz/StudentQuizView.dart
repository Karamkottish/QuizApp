import 'dart:async';

import 'package:english_quiz/Presentation/Views/StudentQuiz/StudentQuizViewModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/LocalQuizModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/QuesitionViewModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/QuestionWidget.dart';
import 'package:english_quiz/Presentation/_Resources/ColorManager.dart';
import 'package:english_quiz/Presentation/_Resources/FontManager.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:english_quiz/Presentation/_Resources/StyleManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_Resources/StringManager.dart';
import '../../_Resources/WidgetValueManager.dart';

class StudentQuizView extends StatefulWidget {
  const StudentQuizView({Key? key}) : super(key: key);

  @override
  State<StudentQuizView> createState() => _StudentQuizViewState();
}

class _StudentQuizViewState extends State<StudentQuizView> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizeManager.s50),
          child:
              AppBar(centerTitle: true, title: const Text(StringManager.quiz))),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Consumer<StudentQuizViewModel>(
                  builder: (context, viewModel, child) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Remaining Time: ${viewModel.timerMinutes}:${viewModel.timerSeconds}",style: TextStyleManager.getMediumStyle(size: FontSizeManager.s15)),
                      );
                  }),
              Consumer<QuestionViewModel>
                (builder: (context, qViewModel, child) =>
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.7,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ListView.builder(
                        itemCount: LocalQuizModel.instance.quizModel!.questions.length,
                    padding: const EdgeInsets.all(8),
                    itemBuilder: (context, index) => Question(index, true,true)),
                  )),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, RouteManager.studentQuizResult);
                  },
                child: const Text(StringManager.submit)),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Provider.of<StudentQuizViewModel>(context,listen: false).startTimer();
    Provider.of<QuestionViewModel>(context,listen: false).stdInitQuizQuestions();

  }
}
