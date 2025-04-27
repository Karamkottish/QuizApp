import 'package:english_quiz/Presentation/Views/TeacherEditQuiz/EditQuizViewModel.dart';
import 'package:english_quiz/Presentation/Views/TeacherQuizInfo/TeacherQuizInfoViewModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/BackButton.dart';
import 'package:english_quiz/Presentation/_CommonModels/LocalQuizModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/QuesitionViewModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/QuestionWidget.dart';
import 'package:english_quiz/Presentation/_Resources/ColorManager.dart';
import 'package:english_quiz/Presentation/_Resources/FontManager.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:english_quiz/Presentation/_Resources/StringManager.dart';
import 'package:english_quiz/Presentation/_Resources/WidgetValueManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Models/UserModel.dart';

class TeacherQuizInfoView extends StatelessWidget {
  const TeacherQuizInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var myProvider = Provider.of<TeacherQuizInfoViewModel>(context);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(AppSizeManager.s50),
            child: AppBar(
              centerTitle: true,
                actions: const [
                  MyBackButton(route: RouteManager.teacherQuizzesRoute,specialAction: LocalQuizModel.myDispose)],
                title: const Text(StringManager.quizInfo))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // putting all the widgets expect the questions because there is
              // a bug that allow the tile color to surpass the widget limited height.
              Container(
                decoration: const BoxDecoration(
                  color: ColorManager.surface
                ),
                child: Column(
                  children: [
                    Text("Quiz ${myProvider.selectedIndex}",
                        style: Theme.of(context).textTheme.displayLarge),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: const Divider(
                            thickness: 2, color: ColorManager.secondary)),
                    const _StudentsRow(),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: const Divider(
                            thickness: 2, color: ColorManager.secondary)),
                  ],
                ),
              ),
              const _QuestionsSection(),
              SizedBox(height: MediaQuery.of(context).size.height*0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    myProvider.deleteQuiz();
                    Navigator.pushReplacementNamed(context,RouteManager.teacherQuizzesRoute);
                  }, child: const Text(StringManager.deleteQuiz)),
                  ElevatedButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, RouteManager.teacherEditQuizRoute);
                  }, child: const Text(StringManager.editQuiz)),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.05)
            ],
          ),
        ));
  }
}

class _StudentsRow extends StatelessWidget {
  const _StudentsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<TeacherQuizInfoViewModel>(context);
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: [
            Text(StringManager.eligibleStudents,
                style: Theme.of(context).textTheme.displayMedium),
            buildList(viewModel.requiredStudents)
          ]),
          const SizedBox(
              height: AppSizeManager.s200,
              child: VerticalDivider(
                  thickness: AppSizeManager.s1, color: ColorManager.secondary)),
          Column(children: [
            Text(StringManager.testedStudents,
                style: Theme.of(context).textTheme.displayMedium),
            buildList(viewModel.testedStudents)
          ]),
        ],
      ),
    );
  }

  Widget buildList(List<UserModel> students) => SizedBox(
      width: AppSizeManager.s170,
      height: AppSizeManager.s200,
      child: Builder(
          builder: (context) => ListView.separated(
              itemCount: students.length,
              separatorBuilder: (context, index) => const Divider(
                  height: AppSizeManager.s4, color: ColorManager.secondary),
              itemBuilder: (context, index) => ListTile(
                    title: Text(
                        "${students[index].firstName} "
                        "${students[index].lastName}",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeightManager.mediumW)),
                    subtitle: Text(students[index].email,
                        style: Theme.of(context).textTheme.bodySmall),
                  ))),
    );


  }

class _QuestionsSection extends StatelessWidget {
  const _QuestionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<TeacherQuizInfoViewModel>(context);
    Provider.of<QuestionViewModel>(context,listen: false).initQuizQuestions();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView.builder(
        itemCount: viewModel.quizModel.questions.length,
        itemBuilder: (context, index) {
          viewModel.myString(index);
          return Question(index,false,false);
        },
      ),
    );
  }
}
