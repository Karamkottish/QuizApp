mixin RepositoryConstants{
  static const String api = "https://10.0.2.2:7228";
  static const String users = "/user/";
  static const String userLogin = "/user/login";
  static const String userRegister = "/user/register";
  static const String getAllStudents = "/user/students";
  static const String addUploadQuiz = "/teacher/addquiz";
  static const String getAllStudentQuizzes = "/student/getallquizzes";

  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 15000;




}