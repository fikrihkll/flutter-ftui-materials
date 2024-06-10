part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccessful extends LoginState {}
final class AlreadyLogin extends LoginState {}
final class LoginError extends LoginState {
  final String message;
  LoginError({required this.message});
}

final class LoginCleared extends LoginState {}