import 'dart:io';

import 'package:dio/dio.dart';

import 'error_model.dart';

class ErrorHandler {
  final String errorMessage;

  ErrorHandler(this.errorMessage);

  // Handle the exception and return an ErrorModel
  static ErrorModel handle(Exception error) {
    if (error is DioException) {
      return ErrorHandler.networkError(error, error.response?.statusCode);
    } else if (error is IOException) {
      return const ErrorModel(
          message: "No internet connection. Please check your settings.");
    } else {
      return const ErrorModel(
          message: "An unknown error occurred. Please try again.");
    }
  }

  // This method should return ErrorModel, not ErrorHandler
  static ErrorModel serverError(int? statusCode, ErrorModel response) {
    switch (statusCode) {
      case 400:
        return const ErrorModel(
            message: "Bad request. Please verify your input and try again.");
      case 401:
      case 402:
      case 403:
      case 404:
        return ErrorModel(message: response.message ?? 'Unauthorized access');
      case 408:
        return const ErrorModel(
            message:
                "Connection timed out. Please check your internet connection.");
      case 409:
        return ErrorModel(message: response.message ?? 'Unauthorized access');
      default:
        return const ErrorModel(
            message: "An unexpected error occurred. Please try again.");
    }
  }

  static ErrorModel networkError(DioException error, int? statusCode) {
    switch (statusCode) {
      case 500:
        if (error.response?.data is Map<String, dynamic>) {
          final errorData = error.response!.data as Map<String, dynamic>;
          final errorMessage = errorData['message'] ??
              "Internal server error. Please try again later.";
          return ErrorModel(message: errorMessage);
        }
        return const ErrorModel(
            message: "Internal server error. Please try again later.");
      case 502:
        return const ErrorModel(
            message: "Bad Gateway. The server received an invalid response.");
      case 503:
        return const ErrorModel(
            message:
                "Service Unavailable. The server is currently unable to handle the request.");
      case 504:
        return const ErrorModel(
            message: "Gateway Timeout. The server took too long to respond.");
      default:
        if (error.response?.data is Map<String, dynamic>) {
          final errorModel =
              ErrorModel.fromMap(error.response!.data as Map<String, dynamic>);
          return ErrorHandler.serverError(
              error.response?.statusCode, errorModel);
        }
        return const ErrorModel(
            message: "An unexpected error occurred. Please try again.");
    }
  }
}
