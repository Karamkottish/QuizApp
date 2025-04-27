import 'package:english_quiz/Presentation/Views/TeacherQuizInfo/TeacherQuizInfoViewModel.dart';
import 'package:english_quiz/Presentation/Views/TeacherQuizes/TeacherQuizzesViewModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/DefaultContainer.dart';
import 'package:english_quiz/Presentation/_CommonModels/LocalQuizModel.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:english_quiz/Presentation/_Resources/StringManager.dart';
import 'package:english_quiz/Presentation/_Resources/WidgetValueManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_CommonModels/BackButton.dart';
import '../../_Resources/ColorManager.dart';

class TeacherQuizzesView extends StatelessWidget {
  const TeacherQuizzesView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<TeacherQuizzesViewModel>(context);
    var selectedQuizProvider = Provider.of<TeacherQuizInfoViewModel>(context);


    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizeManager.s50),
          child: AppBar(
              centerTitle: true,
              actions:const  [
                MyBackButton(route: RouteManager.teacherHomeRoute)],
              title: const Text(StringManager.quizzes))),
      body: ListView.separated(
        separatorBuilder: (context,index) => const
        Divider(height: AppPaddingManager.p18),
          itemCount: viewModel.quizzes.length,
          padding: const EdgeInsets.symmetric(vertical: AppPaddingManager.p10,horizontal: AppPaddingManager.p18),
          itemBuilder: (context, index) {
            return MyContainer(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text("${index + 1}",
                      style: Theme.of(context).textTheme.displayLarge),
                  Text(
                      "Creation Time: ${viewModel.quizzes.elementAt(index).creationTime.toString()}",
                      style: Theme.of(context).textTheme.bodyMedium),
                      Text(
                          "Creation Time: ${viewModel.quizzes.elementAt(index).creationTime.toString()}",
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(
                          "Creation Time: ${viewModel.quizzes.elementAt(index).creationTime.toString()}",
                          style: Theme.of(context).textTheme.bodyMedium),
                      Text(
                          "Creation Time: ${viewModel.quizzes.elementAt(index).creationTime.toString()}",
                          style: Theme.of(context).textTheme.bodyMedium)

                ]),
                IconButton(
                  iconSize: 60,
                  padding: EdgeInsets.zero,
                    onPressed: () {
                    viewModel.saveQuizInfoLocally(viewModel.quizzes.elementAt(index));
                      selectedQuizProvider.setSelectedIndex(index);
                      Navigator.pushReplacementNamed(
                        context, RouteManager.teacherQuizInfoRoute);},
                    icon: const Icon(Icons.arrow_right_rounded,
                        color: ColorManager.primary))
              ],
            ));
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorManager.primary,
        mini: true,
        onPressed: () {
          viewModel.saveQuizInfoLocally(viewModel.templateQuizModel);
          Navigator.pushReplacementNamed(context, RouteManager.teacherAddQuizRoute);
        },
        child: const Text("+")),
    );
  }
}
