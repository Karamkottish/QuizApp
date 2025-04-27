import 'package:english_quiz/Presentation/Views/StudentQuizResult/StudentQuizResultViewModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/QuestionWidget.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_Resources/StringManager.dart';
import '../../_Resources/WidgetValueManager.dart';

class StudentQuizResultView extends StatelessWidget {
  const StudentQuizResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    var viewModel = Provider.of<StudentQuizResultViewModel>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizeManager.s50),
          child:
          AppBar(centerTitle: true, title: const Text(StringManager.quizResult))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Your Quiz Result is: ${viewModel.quizResult}/100"),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.75,
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                  itemCount: viewModel.quizQLength,
                  itemBuilder: (context, index) => Question(index, false, true)),
            ),
            ElevatedButton(onPressed: (){
              viewModel.disposeQuizModel();
              Navigator.pushReplacementNamed(context, RouteManager.studentHome);

            }, child: const Text(StringManager.ok))
          ],
        ),
      ),
    );
  }
}
