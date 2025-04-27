import 'package:english_quiz/Presentation/Views/TeacherStatistics/TeacherStatisticsViewModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/BackButton.dart';
import 'package:english_quiz/Presentation/_CommonModels/DefaultContainer.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:english_quiz/Presentation/_Resources/StringManager.dart';
import 'package:english_quiz/Presentation/_Resources/StyleManager.dart';
import 'package:english_quiz/Presentation/_Resources/WidgetValueManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TeacherStatisticsView extends StatelessWidget {
  const TeacherStatisticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<TeacherStatisticsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          actions: const [MyBackButton(route: RouteManager.teacherHomeRoute)],
          centerTitle: true,
          title: const Text(StringManager.statistics)),
      body: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: AppSizeManager.s16),
          itemCount: viewModel.statistics.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyContainer(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(viewModel.getQuizTitle(index),
                        style: TextStyleManager.getMediumStyle()),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(viewModel.getEligibleStdText(index),textAlign: TextAlign.center),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: const VerticalDivider(thickness: 1)),
                        Text(viewModel.getTestedStdText(index),textAlign: TextAlign.center),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: const VerticalDivider(thickness: 1)),
                        Text(viewModel.getMarkAVGText(index),textAlign: TextAlign.center),
                      ],
                    )
                  ],
                )),
          )),
    );
  }
}
