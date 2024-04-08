part of 'number_counter_bloc.dart';

@immutable
sealed class NumberCounterEvent {}

class AddNumberEvent extends NumberCounterEvent {

  final String inputNumber;
  AddNumberEvent({required this.inputNumber});

}
