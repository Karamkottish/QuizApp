import 'package:english_quiz/Models/Roles.dart';
import 'package:english_quiz/Models/SharedPrefConstants.dart';
import 'package:english_quiz/Presentation/Views/TeacherHome/TeacherHomeViewModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/BackButton.dart';
import 'package:english_quiz/Presentation/_Resources/ColorManager.dart';
import 'package:english_quiz/Presentation/_Resources/FontManager.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:english_quiz/Presentation/_Resources/StringManager.dart';
import 'package:english_quiz/Presentation/_Resources/StyleManager.dart';
import 'package:english_quiz/Presentation/_Resources/WidgetValueManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TeacherHomeView extends StatefulWidget {
  const TeacherHomeView({Key? key}) : super(key: key);

  @override
  State<TeacherHomeView> createState() => _TeacherHomeViewState();
}

class _TeacherHomeViewState extends State<TeacherHomeView>{




  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      builder: (context, snapshot) => Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(AppSizeManager.s50),
            child: AppBar(
                centerTitle: true,
                title:const Text(StringManager.teacherHome))),
        body: SingleChildScrollView(
            child: contentWidget()
        ),
      ),
    );
  }



  Widget contentWidget(){
    var viewModel = Provider.of<TeacherHomeViewModel>(context);
    return Center(
        child: Column(
          children: [
            Text(viewModel.getGreeting()),
            myContainer(StringManager.quizzes, RouteManager.teacherQuizzesRoute),
            myContainer(StringManager.statistics, RouteManager.teacherStatisticsRoute),
            const Divider(thickness: 2),
            Builder(
                builder: (context) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       if(viewModel.isAdmin()) TextButton(onPressed: () {
                          Navigator.pushReplacementNamed(context,
                              RouteManager.adminAddTeacherRoute);
                        }, child: const Text(StringManager.addTeacher)),
                        TextButton(onPressed: () {
                          Navigator.pushReplacementNamed(context,
                              RouteManager.teacherMessagesRoute);
                        }, child: const Text(StringManager.studentsMessages))
                      ]);
                }
            )
          ],
        ),
    );
  }


  Widget myContainer(String text, String route){
    return Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35,vertical: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: AppSizeManager.s16,
                  backgroundColor:ColorManager.primaryContainer,
                  minimumSize: const Size(double.maxFinite, 218),
                  side: const BorderSide(color: ColorManager.primary)
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, route),
              child: Text(text , style: Theme.of(context).textTheme.displayLarge),
            ),
          );
        }
    );
  }

  @override
  void initState() {

  }
}
