import 'package:english_quiz/Presentation/Views/Login/LoginViewModel.dart';
import 'package:english_quiz/Presentation/Views/Register/RegisterViewModel.dart';
import 'package:english_quiz/Presentation/Views/StudentHome/StudentHomeViewModel.dart';
import 'package:english_quiz/Presentation/Views/StudentQuiz/StudentQuizViewModel.dart';
import 'package:english_quiz/Presentation/Views/StudentQuizResult/StudentQuizResultViewModel.dart';
import 'package:english_quiz/Presentation/Views/StudentSendEmail/StudentMessageViewModel.dart';
import 'package:english_quiz/Presentation/Views/TeacherAddQuiz/AddQuizViewModel.dart';
import 'package:english_quiz/Presentation/Views/TeacherEditQuiz/EditQuizViewModel.dart';
import 'package:english_quiz/Presentation/Views/TeacherHome/TeacherHomeViewModel.dart';
import 'package:english_quiz/Presentation/Views/TeacherQuizInfo/TeacherQuizInfoViewModel.dart';
import 'package:english_quiz/Presentation/Views/TeacherQuizes/TeacherQuizzesViewModel.dart';
import 'package:english_quiz/Presentation/Views/TeacherStatistics/TeacherStatisticsViewModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/QuesitionViewModel.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Presentation/_Resources/ThemeManager.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal({Key? key}):super(key: key);
  static const _instance = MyApp._internal();
  factory MyApp() => _instance;




  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => RegisterViewModel()),
        ChangeNotifierProvider(create: (_) => TeacherHomeViewModel()),
        ChangeNotifierProvider(create: (_) => TeacherQuizzesViewModel()),
        ChangeNotifierProvider(create: (_) => TeacherQuizInfoViewModel()),
        ChangeNotifierProvider( create: (_)=> QuestionViewModel()),
        ChangeNotifierProvider( create: (_)=> AddQuizViewModel()),
        ChangeNotifierProvider(create: (_) => TeacherEditQuizViewModel()),
        ChangeNotifierProvider(create: (_) => TeacherStatisticsViewModel()),
        ChangeNotifierProvider(create: (_) => StudentHomeViewModel()),
        ChangeNotifierProvider(create: (_) => StudentQuizViewModel()),
        ChangeNotifierProvider(create: (_) => StudentQuizResultViewModel()),
        ChangeNotifierProvider(create: (_) => StudentMessageViewModel())
      ],
      child: MaterialApp(
        theme: ThemeManager.lightThemeData,
        initialRoute: RouteManager.loginRoute,
        onGenerateRoute: RouteManager.myRouteGenerator,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}