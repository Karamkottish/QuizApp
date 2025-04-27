import 'package:english_quiz/Presentation/_CommonModels/QuesitionViewModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/QuestionWidget.dart';
import 'package:english_quiz/Presentation/_Resources/ColorManager.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:english_quiz/Presentation/_Resources/StringManager.dart';
import 'package:english_quiz/Presentation/_Resources/StyleManager.dart';
import 'package:english_quiz/Presentation/_Resources/WidgetValueManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../_CommonModels/BackButton.dart';
import '../../_CommonModels/LocalQuizModel.dart';
import '../../_Resources/FontManager.dart';
import 'AddQuizViewModel.dart';

class AddQuizView extends StatefulWidget {
  const AddQuizView({Key? key}) : super(key: key);

  @override
  State<AddQuizView> createState() => _AddQuizViewState();
}

class _AddQuizViewState extends State<AddQuizView> {
  TextEditingController durationController = TextEditingController();
  TextEditingController quizDaysController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<QuestionViewModel>(context, listen: false).initQuizQuestions();
    Provider.of<AddQuizViewModel>(context,listen: false).fetchAvailableStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizeManager.s50),
          child: AppBar(
              centerTitle: true,
              actions: const [
                MyBackButton(
                    route: RouteManager.teacherQuizzesRoute,
                    specialAction: LocalQuizModel.myDispose)
              ],
              title: const Text(StringManager.addQuiz))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text("General Information",
                  style: TextStyleManager.getMediumStyle()),
            ),
            Consumer<AddQuizViewModel>(
              builder: (context, viewModel, child) => Container(
                decoration: const BoxDecoration(color: ColorManager.surface),
                child: Row(
                  children: [
                    // types radio tiles
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(StringManager.type),
                            RadioListTile(
                                activeColor: ColorManager.primary,
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                dense: true,
                                value: viewModel.getSelectionValue(0),
                                groupValue: viewModel.selectedQuizType,
                                onChanged: (newIndex) =>
                                    viewModel.setQuizLevelSelection(newIndex!),
                                title: Text(StringManager.nonLevelTest,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium)),
                            RadioListTile(
                                activeColor: ColorManager.primary,
                                contentPadding: EdgeInsets.zero,
                                visualDensity: VisualDensity.compact,
                                dense: true,
                                value: viewModel.getSelectionValue(1),
                                groupValue: viewModel.selectedQuizType,
                                onChanged: (newIndex) =>
                                    viewModel.setQuizLevelSelection(newIndex!),
                                title: Text(StringManager.levelTest,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium))
                          ]),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.12,
                        child: const VerticalDivider(
                          color: ColorManager.primary,
                          thickness: 2,
                        )),

                    // duration and expiry date
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(children: [
                          TextFormField(
                              controller: durationController,
                              keyboardType: TextInputType.number,
                              onChanged: (text) =>
                                  viewModel.onDurationChange(text),
                              decoration: InputDecoration(
                                  helperText: " ",
                                  hintText: StringManager.duration,
                                  labelText: StringManager.duration,
                                  errorText:
                                      viewModel.getDurationErrorMessage)),
                          TextFormField(
                              controller: quizDaysController,
                              keyboardType: TextInputType.number,
                              onChanged: (text) =>
                                  viewModel.onQuizDaysChange(text),
                              decoration: InputDecoration(
                                  helperText: " ",
                                  hintText: StringManager.quizDays,
                                  labelText: StringManager.quizDays,
                                  errorText: viewModel.getQuizDaysErrorMessage))
                        ]))
                  ],
                ),
              ),
            ),
            const Divider(color: ColorManager.primary, thickness: 1.5),
            Consumer<QuestionViewModel>(
              builder: (context, qViewModel, child) => Column(
                children: [
                  Text(StringManager.quizQuestions,
                      style: TextStyleManager.getMediumStyle()),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          qViewModel.addQuestion();
                          qViewModel.initQuizQuestions();
                        },
                        child: const Text(StringManager.addQuestion)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ListView.builder(
                        itemCount: qViewModel.quizQuestions.length,
                        itemBuilder: (context, index) =>
                            Question(index, true, false)),
                  ),
                ],
              ),
            ),
            const Divider(color: ColorManager.primary, thickness: 1.5),
            Consumer<AddQuizViewModel>(
                builder: (context, viewModel, child) => Column(
                      children: [
                        Text(StringManager.chooseStudents,
                            style: TextStyleManager.getMediumStyle()),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ListView.separated(
                              itemCount: viewModel.getStudentsLength,
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                      height: AppSizeManager.s4,
                                      color: ColorManager.secondary),
                              itemBuilder: (context, index) => ListTile(
                                    title: Text(
                                        viewModel.getStudentFullName(index),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight:
                                                    FontWeightManager.mediumW)),
                                    subtitle: Text(
                                        viewModel.getStudentEmail(index),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                    trailing: viewModel.getSelectionIcon(index),
                                    enabled: true,
                                    onTap: () => viewModel.handleStdTap(index),
                                  )),
                        ),
                      ],
                    )),
            Consumer<AddQuizViewModel>(
                builder: (context, viewModel, child) => ElevatedButton(
                    onPressed: !viewModel.getIsValidInput
                        ? null
                        : () => viewModel.uploadQuiz(),
                    child: const Text(StringManager.addQuiz)))
          ],
        ),
      ),
    );
  }
}
