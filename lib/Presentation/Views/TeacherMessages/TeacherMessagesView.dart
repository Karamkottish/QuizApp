import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:flutter/material.dart';

import '../../_CommonModels/BackButton.dart';
import '../../_Resources/StringManager.dart';
import '../../_Resources/WidgetValueManager.dart';

class TeacherMessagesView extends StatelessWidget {
  const TeacherMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizeManager.s50),
          child: AppBar(
              centerTitle: true,
              actions: const [MyBackButton(route: RouteManager.teacherHomeRoute)],
              title:const Text(StringManager.messages))),
      body: SingleChildScrollView(
        child: contentWidget(),
      ),
    );
  }
}

Widget contentWidget(){
  return Builder(builder: (context) {
    return Container();
  });
}

