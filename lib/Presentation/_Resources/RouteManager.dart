import 'package:english_quiz/Presentation/Views/AdminAddTeacher/AddTeacherView.dart';
import 'package:english_quiz/Presentation/Views/ErrorView.dart';
import 'package:english_quiz/Presentation/Views/Login/LoginView.dart';
import 'package:english_quiz/Presentation/Views/Register/RegisterView.dart';
import 'package:english_quiz/Presentation/Views/StudentHome/StudentHomeView.dart';
import 'package:english_quiz/Presentation/Views/StudentQuiz/StudentQuizView.dart';
import 'package:english_quiz/Presentation/Views/StudentQuizResult/StudentQuizResultView.dart';
import 'package:english_quiz/Presentation/Views/StudentSendEmail/StudentMessageView.dart';
import 'package:english_quiz/Presentation/Views/TeacherAddQuiz/AddQuizView.dart';
import 'package:english_quiz/Presentation/Views/TeacherEditQuiz/EditQuizView.dart';
import 'package:english_quiz/Presentation/Views/TeacherHome/TeacherHomeView.dart';
import 'package:english_quiz/Presentation/Views/TeacherMessages/TeacherMessagesView.dart';
import 'package:english_quiz/Presentation/Views/TeacherQuizInfo/TeacherQuizInfoView.dart';
import 'package:english_quiz/Presentation/Views/TeacherQuizes/TeacherQuizzesView.dart';
import 'package:english_quiz/Presentation/Views/TeacherStatistics/TeacherStatisticsView.dart';
import 'package:english_quiz/Presentation/_Resources/StyleManager.dart';
import 'package:flutter/material.dart';

mixin RouteManager{
  static const String loginRoute = "/";
  static const String registerRoute = "/register";
  static const String teacherHomeRoute = "/TeacherHome";
  static const String teacherQuizzesRoute = "/TeacherHome/TeacherQuizzes";
  static const String teacherAddQuizRoute = "/TeacherHome/TeacherQuizzes/TeacherAddQuiz";
  static const String teacherQuizInfoRoute = "/TeacherHome/TeacherQuizzes/TeacherQuizInfo";
  static const String teacherEditQuizRoute = "/TeacherHome/TeacherQuizzes/TeacherQuizInfo/EditQuiz";
  static const String teacherEditQuestionRoute = "/TeacherHome/TeacherQuizzes/TeacherQuizInfo/EditQuiz/EditQuestion";
  static const String teacherStatisticsRoute = "/TeacherHome/TeacherStatistics";
  static const String teacherMessagesRoute = "/TeacherHome/TeacherMessages";
  static const String adminAddTeacherRoute = "/TeacherHome/AdminAddTeacher";
  static const String studentHome = "/StudentHome";
  static const String studentQuiz = "/StudentHome/Quiz";
  static const String studentQuizResult = "/StudentHome/Quiz/QuizResult";
  static const String studentMessage = "/StudentHome/Message";

  static Route<dynamic> myRouteGenerator(RouteSettings routeSettings){
    switch(routeSettings.name){
       case RouteManager.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouteManager.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case RouteManager.teacherHomeRoute:
        return MaterialPageRoute(builder: (_) => const TeacherHomeView());
      case RouteManager.teacherQuizzesRoute:
        return MaterialPageRoute(builder: (_) => const TeacherQuizzesView());
      case RouteManager.teacherAddQuizRoute:
        return MaterialPageRoute(builder: (_) => const AddQuizView());
      case RouteManager.teacherQuizInfoRoute:
        return MaterialPageRoute(builder: (_) => const TeacherQuizInfoView());
      case RouteManager.teacherEditQuizRoute:
        return MaterialPageRoute(builder: (_) => const TeacherEditQuizView());
      case RouteManager.teacherStatisticsRoute:
        return MaterialPageRoute(builder: (_) => const TeacherStatisticsView());
      case RouteManager.adminAddTeacherRoute:
        return MaterialPageRoute(builder: (_) => AddTeacherView());
      case RouteManager.teacherMessagesRoute:
        return MaterialPageRoute(builder: (_) => const TeacherMessagesView());
      case RouteManager.studentHome:
        return MaterialPageRoute(builder: (_) => const StudentHomeView());
      case RouteManager.studentQuiz:
        return MaterialPageRoute(builder: (_) => const StudentQuizView());
      case RouteManager.studentQuizResult:
        return MaterialPageRoute(builder: (_) => const StudentQuizResultView());
      case RouteManager.studentMessage:
        return MaterialPageRoute(builder: (_) => const StudentMessageView());
      default: return MaterialPageRoute(builder: (_) => const ErrorView());

    }


  }


}