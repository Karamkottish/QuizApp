import 'package:english_quiz/Repository/Remote/Repository.dart';
import 'package:flutter/material.dart';

import '../../../Models/StatisticsModel.dart';

class TeacherStatisticsViewModel extends ChangeNotifier{

  final List<StatisticsModel> _statistics = [
    for(double i = 0; i < 6; i++)
      StatisticsModel(60, 40, 60+i, 74+i)
  ];


  List<StatisticsModel> get statistics => _statistics;
  Repository myRepo = Repository();



  String getQuizTitle(int index) => "Quiz $index";

  String getEligibleStdText(int index) => "Eligible St.\n${_statistics[index].requiredStudents} St.";

  String getTestedStdText(int index) => "Tested St.\n${_statistics[index].testedStudents} St.\n ${_statistics[index].testedStudentsRatio}%";

  String getMarkAVGText(int index) => "Marks AVG\n${_statistics[index].marksAvg}/100";

  void getStatistics() async {
    //TODO: implement the get method in repository
    myRepo.fetchStatistics();
  }




}