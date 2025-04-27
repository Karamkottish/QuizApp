import 'package:english_quiz/Presentation/_CommonModels/QuesitionViewModel.dart';
import 'package:english_quiz/Presentation/_Resources/ColorManager.dart';
import 'package:english_quiz/Presentation/_Resources/StringManager.dart';
import 'package:english_quiz/Presentation/_Resources/WidgetValueManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Question extends StatefulWidget {
  final int qIndex;
  final bool isEditable;
  final bool isStd;

  const Question(this.qIndex, this.isEditable, this.isStd, {Key? key})
      : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<QuestionViewModel>(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(viewModel.getQText(widget.qIndex),
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                if (widget.isEditable && !widget.isStd)
                  IconButton(
                      color: ColorManager.primary,
                      splashRadius: 15,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        viewModel.deleteQuestion(widget.qIndex);
                        viewModel.initQuizQuestions();
                        },
                      icon: const Icon(Icons.delete_forever))
              ]),
            ],
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: viewModel.getQAnswersNumber(widget.qIndex),
              //builder here
              itemBuilder: (context, answerIndex) {
                return RadioListTile(
                  secondary: (answerIndex>1 && !widget.isStd && widget.isEditable)? TextButton(onPressed:
                  () {
                    viewModel.deleteQAnswer(widget.qIndex,answerIndex);
                    viewModel.initQuizQuestions();
                  },
                      child: const Text(StringManager.deleteAnswer)): null,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppSizeManager.s16)),
                    activeColor: ColorManager.primary,
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity.compact,
                    dense: true,
                    selectedTileColor: ColorManager.primary,
                    //logics
                    tileColor: (!widget.isStd)
                        ? viewModel.setAnsColorDependOnCorrect(
                            widget.qIndex, answerIndex)
                        : (widget.isStd && !widget.isEditable)
                            ? viewModel.setAnsColorDependOnBoth(
                                widget.qIndex, answerIndex)
                            : viewModel.setAnsColorDependOnSelect(
                                widget.qIndex, answerIndex),

                    title: Text(
                        viewModel.getAnsText(widget.qIndex, answerIndex),
                        style: Theme.of(context).textTheme.bodyMedium),
                    value: answerIndex,
                    groupValue: viewModel.selectionManager[widget.qIndex],
                    // this statement was to change the selection
                    onChanged: (widget.isEditable && !widget.isStd)
                        ? (newIndex) => viewModel.teacherSetQAnswerSelect(
                            widget.qIndex, newIndex as int)
                        : (widget.isEditable && widget.isStd)
                            ? (newIndex) => viewModel.stdSetQAnswerSelect(
                                widget.qIndex, newIndex as int)
                            : null);
              }),
          if(widget.isEditable && !widget.isStd)
            TextButton(
                onPressed: () {
                  viewModel.addAnswerToQ(widget.qIndex);
                  viewModel.initQuizQuestions();
                }, child: const Text(StringManager.addAnswer)),
          if(widget.isEditable && !widget.isStd)
            TextFormField(
                onChanged: (newText) {
                  // to get question index and change the text accordingly
                  viewModel.setQText(widget.qIndex, newText);
                },
                initialValue: viewModel.getQText(widget.qIndex),
                decoration: InputDecoration(
                helperText: "",
                hintText: StringManager.questionText,
                labelText: StringManager.questionText,
                errorText: viewModel.getQuestionErrorMessage(widget.qIndex))

            ),
          if (widget.isEditable && !widget.isStd)
            TextFormField(
              onChanged: (newText) {
                // to get the selected index and change the text accordingly
                var selected = viewModel.quizQuestions[widget.qIndex].answers
                    .indexWhere((answer) => answer.isSelected);
                viewModel.setAnswerText(widget.qIndex, selected, newText);
              },
              initialValue: viewModel.getSelectedAnswerT(widget.qIndex),
                decoration: InputDecoration(
                    helperText: "",
                    hintText: StringManager.answerText,
                    labelText: StringManager.answerText,
                    errorText: viewModel.getAnswersErrorMessage(widget.qIndex))
            ),
        ],
      ),
    );
  }
}
