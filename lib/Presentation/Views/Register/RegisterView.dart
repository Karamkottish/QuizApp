import 'package:english_quiz/Presentation/Views/Register/RegisterViewModel.dart';
import 'package:english_quiz/Presentation/_Resources/ColorManager.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:english_quiz/Presentation/_Resources/StringManager.dart';
import 'package:english_quiz/Presentation/_Resources/WidgetValueManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController firstNameTextController = TextEditingController();
  final TextEditingController lastNameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<RegisterViewModel>(context);

    return Scaffold(
      backgroundColor: ColorManager.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPaddingManager.p25),
        child: Column(
          children: [
            const SizedBox(height: AppSizeManager.s50),
            Text(StringManager.registerRegister,style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: AppSizeManager.s50),

            TextFormField(
              controller: emailTextController,
              decoration: InputDecoration(
                  helperText: " ",
                  hintText: StringManager.registerEmail,
                  labelText: StringManager.registerEmail,
                  errorText: viewModel.email.errorMessage),
              onChanged: (input) => viewModel.checkEmail(input),
            ),
            TextFormField(
              controller: firstNameTextController,
              decoration: InputDecoration(
                  helperText: " ",
                  hintText: StringManager.registerFirstName,
                  labelText: StringManager.registerFirstName,
                  errorText: viewModel.firstName.errorMessage),
              onChanged: (input) => viewModel.checkFirstName(input),
            ),
            TextFormField(
              controller: lastNameTextController,
              decoration: InputDecoration(
                  helperText: " ",
                  hintText: StringManager.registerLastName,
                  labelText: StringManager.registerLastName,
                  errorText: viewModel.lastName.errorMessage),
              onChanged: (input) => viewModel.checkLastName(input),
            ),
            TextFormField(
              controller: passwordTextController,
              decoration: InputDecoration(
                  helperText: " ",
                  hintText: StringManager.loginPassword,
                  labelText: StringManager.loginPassword,
                  errorText: viewModel.password.errorMessage),
              onChanged: (input) => viewModel.checkPassword(input),
            ),

            ElevatedButton(
                onPressed: viewModel.isValidInput ?
                    () async {
                      await viewModel.registerStd();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              duration: const Duration(seconds: 8),
                              content: Text(viewModel.res.message)));

                    } : null,
                child: const Text(StringManager.registerRegister)),

            const SizedBox(height: AppSizeManager.s50),
            TextButton(onPressed: (){
              Navigator.pushReplacementNamed(context, RouteManager.loginRoute);
            }, child: const Text(StringManager.loginLogin))
          ],
        ),
      ),
    );
  }
}
