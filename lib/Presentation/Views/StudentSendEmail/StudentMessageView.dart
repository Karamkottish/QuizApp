import 'package:english_quiz/Presentation/Views/StudentSendEmail/StudentMessageViewModel.dart';
import 'package:english_quiz/Presentation/_CommonModels/BackButton.dart';
import 'package:english_quiz/Presentation/_Resources/ColorManager.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:english_quiz/Presentation/_Resources/StyleManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../_Resources/FontManager.dart';
import '../../_Resources/StringManager.dart';
import '../../_Resources/WidgetValueManager.dart';

class StudentMessageView extends StatefulWidget {
  const StudentMessageView({Key? key}) : super(key: key);

  @override
  State<StudentMessageView> createState() => _StudentMessageViewState();
}

class _StudentMessageViewState extends State<StudentMessageView>{

  TextEditingController messageInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<StudentMessageViewModel>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(AppSizeManager.s50),
          child:
          AppBar(
              centerTitle: true,
              actions: const[MyBackButton(route: RouteManager.studentHome)],
              title: const Text(StringManager.sendMessageToTeacher))),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 10,
              controller: messageInputController,
                decoration: InputDecoration(
                    helperText: " ",
                    hintText: StringManager.message,
                    labelText: StringManager.message,
                    errorText: viewModel.getErrorMessage),
                onChanged: (input) => viewModel.onMessageChange(input)
            ),
            Text(StringManager.availableTeacher,style: TextStyleManager.getMediumStyle()),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.3,
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(thickness: 1,color: ColorManager.primary),
                  itemCount: viewModel.getAvailableTeachersLength,
                  itemBuilder: (context, index) => ListTile(
                    enabled: true,
                    title: Text(viewModel.getTeacherFullName(index),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeightManager.mediumW)),
                    onTap:() => viewModel.onTeacherSelectionChange(index),
                  )),
            ),
            Text("${StringManager.sendMessageTo} : ${viewModel.getSelectedTeacherFullName}"),
            SizedBox(height: MediaQuery.of(context).size.height*0.1),
            ElevatedButton(
                onPressed:viewModel.ValidateInput?
                ()=> viewModel.sendMessage(): null, child: const Text(StringManager.sendMessage))

          ],
        ),
      ),
    );
  }
}
