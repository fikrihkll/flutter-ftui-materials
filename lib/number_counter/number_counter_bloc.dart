import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'number_counter_event.dart';
part 'number_counter_state.dart';

class NumberCounterBloc extends Bloc<NumberCounterEvent, NumberCounterState> {

  int summationResult = 0;

  NumberCounterBloc() : super(AddNumberInitialState()) {
    on<AddNumberEvent>((event, emit) {
      // Berikan state Loading sebelum proses dimulai
      emit(AddNumberLoadingState());

      String inputNumber = event.inputNumber;
      try {
        summationResult = int.parse(inputNumber) + summationResult;

        // Proses penjumlahan berhasil, berikan state Success
        emit(AddNumberSuccessState(result: summationResult));
      } on Exception catch (exception) {
        // Proses penjumlahan gagal, berikan state Failed
        emit(AddNumberFailedState(message: exception.toString()));
      }
    });
  }
}
