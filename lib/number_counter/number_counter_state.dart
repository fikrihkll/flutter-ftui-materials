part of 'number_counter_bloc.dart';

@immutable
sealed class NumberCounterState {}

final class AddNumberInitialState extends NumberCounterState {}

final class AddNumberLoadingState extends NumberCounterState {}

final class AddNumberSuccessState extends NumberCounterState {

  final int result;
  AddNumberSuccessState({required this.result});

}

final class AddNumberFailedState extends NumberCounterState {

  final String message;
  AddNumberFailedState({required this.message});

}
