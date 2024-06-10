part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class RunLoginEvent extends LoginEvent {
  final String email, password;
  RunLoginEvent({required this.email, required this.password});
}

class CheckLoginStatusEvent extends LoginEvent {}

class ClearLoginDataEvent extends LoginEvent {}