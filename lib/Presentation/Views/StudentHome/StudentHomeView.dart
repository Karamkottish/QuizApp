import 'package:english_quiz/Presentation/Views/StudentHome/StudentHomeViewModel.dart';
import 'package:english_quiz/Presentation/_Resources/StyleManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../_CommonModels/DefaultContainer.dart';
import '../../_Resources/ColorManager.dart';
import '../../_Resources/RouteManager.dart';
import '../../_Resources/StringManager.dart';
import '../../_Resources/WidgetValueManager.dart';

class StudentHomeView extends StatefulWidget {
  const StudentHomeView({Key? key}) : super(key: key);

  @override
  State<StudentHomeView> createState() => _StudentHomeViewState();
}

class _StudentHomeViewState extends State<StudentHomeView> {
  @override
  void initState() {
    Provider.of<StudentHomeViewModel>(context,listen: false).getAllStudentQuizzes();

  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<StudentHomeViewModel>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizeManager.s50),
          child:
              AppBar(centerTitle: true, title: const Text(StringManager.home))),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(viewModel.getWelcome(),
                style: TextStyleManager.getMediumStyle()),
            Text(viewModel.getLevel(),
                style: TextStyleManager.getMediumStyle()),
            const Divider(thickness: 2),
            Text(StringManager.availableQuizzes,
                style: TextStyleManager.getMediumStyle()),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  separatorBuilder: (context, index) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05),
                  itemCount: viewModel.quizNumber,
                  itemBuilder: (context, index) => MyContainer(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${index + 1}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge),
                                Text("Quiz $index",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                Text(
                                    "Question Number: ${viewModel.getQuizQNumber(index)}",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                                Text(
                                    "Duration: ${viewModel.getQuizDuration(index)}",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ]),
                          IconButton(
                              iconSize: 60,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                viewModel.saveQuizInfoLocally(
                                    viewModel.getQuizToSave(index));
                                Navigator.pushReplacementNamed(
                                    context, RouteManager.studentQuiz);
                              },
                              icon: const Icon(Icons.arrow_right_rounded,
                                  color: ColorManager.primary))
                        ],
                      ))),
            ),
            const Divider(thickness: 2),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, RouteManager.studentMessage);
                },
                child: const Text(StringManager.sendMessageToTeacher)),
          ],
        ),
      ),
    );
  }
}
