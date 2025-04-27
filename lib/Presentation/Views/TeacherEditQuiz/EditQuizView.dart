import 'package:english_quiz/Presentation/Views/TeacherEditQuiz/EditQuizViewModel.dart';
import 'package:english_quiz/Presentation/Views/TeacherQuizInfo/TeacherQuizInfoViewModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/BackButton.dart';
import 'package:english_quiz/Presentation/_CommonModels/LocalQuizModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/QuestionWidget.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:english_quiz/Presentation/_Resources/StringManager.dart';
import 'package:english_quiz/Presentation/_Resources/WidgetValueManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_CommonModels/QuesitionViewModel.dart';
import '../../_Resources/ColorManager.dart';
import '../../_Resources/FontManager.dart';
import '../../_Resources/StyleManager.dart';

class TeacherEditQuizView extends StatefulWidget {
  const TeacherEditQuizView({Key? key}) : super(key: key);

  @override
  State<TeacherEditQuizView> createState() => _TeacherEditQuizViewState();
}

class _TeacherEditQuizViewState extends State<TeacherEditQuizView> {
  @override
  Widget build(BuildContext context) {
    var eViewModel = Provider.of<TeacherEditQuizViewModel>(context);
    var otherviewModel = Provider.of<QuestionViewModel>(context,listen: false);
    otherviewModel.initQuizQuestions();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizeManager.s50),
          child: AppBar(
              centerTitle: true,
              actions: [
                Consumer<QuestionViewModel>(
                    builder: (context, viewModel, child) =>
                    (viewModel.validateQuestionsText && viewModel.validateAnswersText)
                            ? const MyBackButton(
                                route: RouteManager.teacherQuizInfoRoute)
                            : TextButton(
                                onPressed: () {},
                                child: Text("back",
                                    style: TextStyleManager.getRegularStyle(
                                        size: FontSizeManager.s13,
                                        color: ColorManager.onPrimary))))
              ],
              title: const Text(StringManager.editQuiz))),
      body: SingleChildScrollView(
          child: Center(
        child: Consumer<QuestionViewModel>(
          builder: (context, viewModel, child) => Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      viewModel.addQuestion();
                      viewModel.initQuizQuestions();
                    },
                    child: const Text(StringManager.addQuestion)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
                  itemCount: eViewModel.questions.length,
                  itemBuilder: (context, index) {
                    return Question(index, true, false);
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
