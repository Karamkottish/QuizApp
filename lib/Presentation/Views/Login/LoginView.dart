import 'package:dio/dio.dart';
import 'package:english_quiz/Presentation/Views/Login/LoginViewModel.dart';
import 'package:english_quiz/Presentation/_Resources/ColorManager.dart';
import 'package:english_quiz/Presentation/_Resources/RouteManager.dart';
import 'package:english_quiz/Presentation/_Resources/StringManager.dart';
import 'package:english_quiz/Presentation/_Resources/WidgetValueManager.dart';
import 'package:english_quiz/Repository/Constants.dart';
import 'package:english_quiz/Repository/Remote/Repository.dart';
import 'package:english_quiz/Repository/Remote/Responses/LoginResponse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



/*
var x = myRepo.post(RepositoryConstants.userLogin,data: {
    "email": "moha@moha.com",
    "password": "AAbbCC@@1"
    });

 */

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  Repository myRepo = Repository();

  @override
  void initState() {
    myRepo.fetchAllStudents();

  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      backgroundColor: ColorManager.surface,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPaddingManager.p25),
        child: Column(
          children: [
            const SizedBox(height: AppSizeManager.s50),
            Text(StringManager.loginWelcome,style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: AppSizeManager.s50),

            TextFormField(
                controller: emailTextController,
                decoration: InputDecoration(
                    helperText: " ",
                    hintText: StringManager.loginEmail,
                    labelText: StringManager.loginEmail,
                    errorText: viewModel.email.errorMessage),
              onChanged: (input) => viewModel.onEmailChange(input),
            ),
            TextFormField(
                controller: passwordTextController,
                decoration: InputDecoration(
                    helperText: " ",
                    hintText: StringManager.loginPassword,
                    labelText: StringManager.loginPassword,
                    errorText: viewModel.password.errorMessage),
              onChanged: (input) => viewModel.onPasswordChange(input),
            ),

            ElevatedButton(
                onPressed: viewModel.isValidInput ?
                    () async {
                      bool isExist = await viewModel.login();
                      isExist?
                      Navigator.pushReplacementNamed(context, viewModel.goTo()):
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("user does not exist")));
                    } : null,
                child: const Text(StringManager.loginLogin)),


            const SizedBox(height: AppSizeManager.s140),
            TextButton(onPressed: ()=> Navigator.pushReplacementNamed(context, RouteManager.registerRoute), child: const Text(StringManager.loginRegister))
          ],
        ),
      ),
    );
  }
}
