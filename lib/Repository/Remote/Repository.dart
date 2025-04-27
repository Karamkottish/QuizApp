import 'dart:async';

import 'package:dio/dio.dart';
import 'package:english_quiz/Models/Guid.dart';
import 'package:english_quiz/Models/UserModel.dart';
import 'package:english_quiz/Repository/Constants.dart';
import 'package:english_quiz/Repository/Remote/Requests/LoginRequest.dart';
import 'package:english_quiz/Repository/Remote/Requests/RegisterRequest.dart';
import 'package:english_quiz/Repository/Remote/Responses/AllStudentsResponse.dart';
import 'package:english_quiz/Repository/Remote/Responses/RegisterResponse.dart';
import 'package:english_quiz/Repository/Remote/Responses/SingleStudentResponse.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../Models/Roles.dart';
import 'Responses/LoginResponse.dart';
import 'Responses/QuizReponses/QuizRequest.dart';

class Repository {
  late final Dio _dio;
  int _timeout = 60000;
  Repository() {
    this._dio = Dio(BaseOptions(
        baseUrl: RepositoryConstants.api,
        connectTimeout: RepositoryConstants.connectionTimeout,
        receiveTimeout: RepositoryConstants.receiveTimeout,
        responseType: ResponseType.json));
    _initInterceptor();
  }

  void _initInterceptor() {
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // get with parameters
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //update
  Future<Response> put(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponse> login(LoginRequest request) async {
    Response rawRes =
        await post(RepositoryConstants.userLogin, data: request.toJson());
    LoginResponse loginResponse = LoginResponse.fromJson(rawRes.data);
    return loginResponse;
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      Response rawRes =
          await post(RepositoryConstants.userRegister, data: request.toJson());
      RegisterResponse registerResponse =
          RegisterResponse(rawRes.data.toString());

      return registerResponse;
    } on DioError catch (e) {
      return RegisterResponse(e.response?.data.toString() ?? "unknownError");
    }
  }

  Future<AllStudentsResponse> fetchAllStudents() async {
    Response rawRes = await get(RepositoryConstants.getAllStudents);
    List<SingleStudentResponse> partialRes = (rawRes.data as List)
        .map((e) => SingleStudentResponse.fromJson(e))
        .toList();

    AllStudentsResponse allStudentsResponse = AllStudentsResponse(partialRes);
    return allStudentsResponse;
  }

  Future<Response?> addUploadQuiz(QuizRequest request) async {
    try {
      Response rawRes =
          await post(RepositoryConstants.addUploadQuiz, data: request.ToJson());
    } on DioError catch (e) {
      print(e.response?.data ?? "null");
    }
  }

  Future<UserModel> getStudentById(String id) async {
    return UserModel(
        id: Guid(""),
        email: '',
        firstName: '',
        lastName: '',
        role: Roles.student,
        isExist: true);
  }
}
